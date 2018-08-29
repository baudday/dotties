" Leader
let mapleader = " "

syntax on
colorscheme material

" material theme stuff ===
let g:material_theme_style = 'dark'

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
" material theme stuff ===

highlight Normal guibg=black guifg=white

au BufRead,BufNewFile *.es6 setfiletype javascript

set nowrap
set synmaxcol=200     " Limit syntax highlighting to lines under 200 chars
set clipboard=unnamed " Use system clipboard
set background=dark
set backspace=2       " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " Always display the status line
set autowrite         " Automatically :write before running commands
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set smartindent
set tw=79
set fo-=l

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Resize windows when you resize vim
autocmd VimResized * :wincmd =

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Work specific mega repos
if (match(system("pwd"), "rpm_site") != -1)
  let g:ctrlp_use_caching = 1
endif

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" Mouse support
set mouse=a

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'material'

nnoremap <C-W> :w<bar>bd<CR>
nnoremap <C-J> :m+<CR>
nnoremap <C-K> :m-2<CR>
