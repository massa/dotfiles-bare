require('keymaps')
require('plugins')
require('setup-zettelkasten')
require('impatient') --Uses impatient plugin to load faster

local config = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
local cache = vim.env.XDG_CACHE_HOME or vim.fn.expand("~/.cache")
local share = vim.env.XDG_DATA_HOME or vim.fn.expand("~/.local/share")

-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --
vim.o.clipboard = "unnamedplus"
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.undodir = { share .. "/nvim/undodir" }
vim.opt.undofile = true
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.backupdir = { share .. "/nvim/backup" }
vim.opt.backup = true
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.listchars.tab = "⇥"
vim.opt.listchars.trail = "⋯"
vim.opt.listchars.nbsp = "⬸"
vim.opt.listchars.extends = "↵"
vim.opt.list = true
vim.opt.matchpairs["<"] = ">"
vim.opt.matchpairs["«"] = "»"
vim.opt.matchpairs["≪"] = "≫"
vim.opt.matchpairs["｢"] = "｣"
vim.opt.shiftwidth = 2
vim.opt.shortmess.c = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.signcolumn = 'number'
vim.opt.smartindent = true
vim.opt.updatetime = 500
vim.opt.wrap = false
vim.opt.whichwrap["["] = true
vim.opt.whichwrap["]"] = true
vim.opt.whichwrap["<"] = true
vim.opt.whichwrap[">"] = true


---
-- Old VIM Script Commands
--
vim.cmd([[
set spell

" Some Debian-specific things
if has("autocmd")
  " set mail filetype for reportbug's temp files
  augroup debian
    au BufRead reportbug-*		set ft=mail
  augroup END

  au BufReadPost * if line("'\"") > 1 && line("'\"") < line("$")
               \|    exe "normal! g`\""
               \|  endif
endif

" Set paper size from /etc/papersize if available (Debian-specific)
if filereadable("/etc/papersize")
  let s:papersize = matchstr(readfile('/etc/papersize', '', 1), '\p*')
  if strlen(s:papersize)
    exe "set printoptions+=paper:" . s:papersize
  endif
endif
]])

---
-- Suppress errors in Windows
-- 

vim.notify = function (msg, log_level, _opts)
    if msg:match("exit code") then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
    vim.api.nvim_echo({{msg}}, true, {})
    end
  end

-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

---
-- Colorscheme
---
vim.opt.termguicolors = true
vim.cmd('colorscheme nord')

---
-- Titus Custom Markdown HUGO Image Insert
---
require'clipboard-image'.setup {
  markdown = {
   img_dir = {"content/images", "%:p:h:t", "%:t:r"},
   img_dir_txt = {"/images", "%:p:h:t", "%:t:r"},
   img_name = function ()
      vim.fn.inputsave()
      local name = vim.fn.input('Name: ')
      vim.fn.inputrestore()

      if name == nil or name == '' then
        return os.date('%y-%m-%d-%H-%M-%S')
      end
      return name
    end,
    img_handler = function ()
        return function (path)
            return os.execute(string.format('~/.scripts/tinypng -s -f %s &', path))
        end
    end
  }
}

-- LSP and Linting Config
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
    'bashls',
    'luau_lsp',
    'marksman',
    'powershell_es',
  },
	automatic_installation = true,
})

require'lspconfig'.bashls.setup{}
require'lspconfig'.luau_lsp.setup{}
require'lspconfig'.marksman.setup{}
require'lspconfig'.powershell_es.setup{
  bundle_path = '~/.local/share/nvim/mason/packages/powershell-editor-services/PowerShellEditorServices/',
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

require("null-ls").setup({
	sources = {
			require("null-ls").builtins.formatting.stylua,
			require("null-ls").builtins.code_actions.cspell,
			require("null-ls").builtins.diagnostics.codespell,
			require("null-ls").builtins.completion.spell,
			require("null-ls").builtins.code_actions.proselint,
			require("null-ls").builtins.diagnostics.write_good,
	},
})

-- File Explorer nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

--Pretty Status bar
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'nord',
	},
}

-- Add Ctrl + X and initialize toggle term 
require("toggleterm").setup {
	open_mapping = [[<c-x>]],
	shade_terminals = false
}

-- Add projects capability to telescope
require('telescope').load_extension('projects')

-- Smarter Indent setup
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

