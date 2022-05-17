
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
let $NVIM_TUI_ENABLE_CURSOR_SHAPE   = 0

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

silent! colorscheme purify
syntax on

