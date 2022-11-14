
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

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

set autowrite
set autoread
set background=dark
set backupdir-=.
set backupdir-=~/.local/share/nvim/backup
set backupdir+=~/.cache/nvim/backups
set backupdir+=/tmp
set backup
set cmdheight=1
set directory+=/tmp
set expandtab
set guicursor=
set hidden
set ignorecase
set listchars=tab:⇥ ,trail:⋯,nbsp:⬸,extends:↵
set list
set matchpairs+=<:>,«:»,≪:≫,｢:｣
set mouse=a
set shiftwidth=2
set shortmess+=c
set showcmd
set showmatch
set noshowmode
set signcolumn=yes
set smartcase
set smartindent
set updatetime=500
set undofile
set nowrap
set whichwrap+=<
set whichwrap+=>
set whichwrap+=[
set whichwrap+=]

nmap <Leader><Up> :cp<CR>
nmap <Leader><Left> :cr<CR>
nmap <Leader><Down> :cn<CR>
nmap <Leader><Right> :cnf<CR>
nmap <Leader><Insert> :cw<CR>
nmap <Leader><Leader>  w _
nmap <F2> :w<CR>
nmap <F3>  n _
nmap <F4> :q<CR>
nmap <Leader><F4> :q!<CR>
nmap <S-F4> :qa!<CR>
nmap <F9> <Esc>:make<CR>

let g:Perl_AuthorName         = 'Humberto Massa'
let g:Perl_AuthorRef          = 'hm'
let g:Perl_Email              = 'humbertomassa@gmail.com'
let g:Perl_Company            = 'ALMG'
let g:LargeFile               = 2
let g:raku_unicode_abbrevs    = 0
let g:pascal_delphi           = 1
let g:suda_smart_edit         = 0
let g:csv_autocmd_arrange     = 1
let g:rainbow_active          = 0
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'purify'
let g:lightline               = { 'colorscheme': 'landscape', }
let g:solarized_termtrans     = 0
let g:ale_cpp_cc_options      = '-std=c++20 -Wall'
let g:ale_linters             = { 'python': ['pylint'], 'vim': ['vint'], 'cpp': ['clang'], 'c': ['clang'] }

" let g:coc_disable_startup_warning = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:deoplete#enable_at_startup    = 1
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE   = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

call plug#begin('~/.config/nvim/plugged')

" Plug from http://vim-scripts.org/vim/scripts.html
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/extradite.vim'
Plug 'vim-scripts/repeat.vim'
Plug 'vim-scripts/speeddating.vim'
Plug 'vim-scripts/unimpaired.vim'
"Plug 'vim-scripts/csv.vim'
Plug 'mechatroner/rainbow_csv'

" Others
"Plug 'massa/vim-delphi'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

Plug 'neovim/nvim-lspconfig'

Plug 'renerocksai/telekasten.nvim'
Plug 'renerocksai/calendar-vim'

Plug 'kevinoid/vim-jsonc'

Plug 'bhurlow/vim-parinfer'

Plug 'sheerun/vim-polyglot'

Plug 'hashivim/vim-vagrant'

Plug 'lambdalisue/suda.vim'

Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-dotoo'
Plug 'jceb/vim-orgmode'

Plug 'pelodelfuego/vim-swoop'

Plug 'w0rp/ale'
Plug 'rhysd/vim-crystal'

Plug 'altercation/vim-colors-solarized'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim'

Plug 'hokaccha/vim-prove'

Plug 'frazrepo/vim-rainbow'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'

Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'nanotee/sqls.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'severin-lemaignan/vim-minimap'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'kyoz/purify', { 'rtp': 'vim' }

Plug 'Raku/vim-raku'

"Plug 'plan9-for-vimspace/plan9-for-vimspace'

" All of your Plugins must be added before the following line
call plug#end()

nnoremap <silent> <leader>du :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>
let g:db_ui_save_location = '~/.config/db_ui'

silent! colorscheme purify
syntax on

lua << END
local home = vim.fn.expand("~/.zettelkasten")
-- NOTE for Windows users:
-- - don't use Windows
-- - try WSL2 on Windows and pretend you're on Linux
-- - if you **must** use Windows, use "/Users/myname/zettelkasten" instead of "~/zettelkasten"
-- - NEVER use "C:\Users\myname" style paths
-- - Using `vim.fn.expand("~/zettelkasten")` should work now but mileage will vary with anything outside of finding and opening files
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    -- dir names for special notes (absolute path or subdir name)
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- Generate note filenames. One of:
    -- "title" (default) - Use title if supplied, uuid otherwise
    -- "uuid" - Use uuid
    -- "uuid-title" - Prefix title by uuid
    -- "title-uuid" - Suffix title with uuid
    new_note_filename = "title",
    -- file uuid type ("rand" or input for os.date()")
    uuid_type = "%Y%m%d%H%M",
    -- UUID separator
    uuid_sep = "-",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- skip telescope prompt for goto_today and goto_thisweek
    journal_auto_open = false,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- default sort option: 'filename', 'modified'
    sort = "filename",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

    -- should all links be updated when a file is renamed
    rename_update_links = true,

    vaults = {
        vault2 = {
            -- alternate configuration for vault2 here. Missing values are defaulted to
            -- default values from telekasten.
            -- e.g.
            -- home = "/home/user/vaults/personal",
        },
    },

    -- how to preview media files
    -- "telescope-media-files" if you have telescope-media-files.nvim installed
    -- "catimg-previewer" if you have catimg installed
    media_previewer = "telescope-media-files",

    -- A customizable fallback handler for urls.
    follow_url_fallback = nil,
})
END

