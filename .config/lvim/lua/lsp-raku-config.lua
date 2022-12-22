local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

if not configs.raku_lsp then
  configs.raku_lsp = {
    default_config = {
      cmd = '/home/h/.vscode-oss/extensions/bscan.raku-navigator-0.1.0/server/src/raku/navigator.raku',
      filetypes = {'raku'},
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end,
      settings = {},
    }
  }
end

configs.raku_lsp.setup{}
lspconfig.raku_lsp.setup{}
