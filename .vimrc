set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'ervandew/supertab'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-rails'

" Look and feel
colorscheme Sunburst
filetype plugin indent on
syntax on
set number

" Ignore case in searches unless there are upper-case characters in the search
set ignorecase
set smartcase

" Show some info about the current command
set showcmd

" Search incrementally
set incsearch

" Use wildmenu
set wildmenu
set wildmode=list:longest

" Keybindings
let mapleader=" "
:nmap ; :

" Set up tab to switch to last used buffer
nnoremap <Tab> :b#<CR>

" Live dangerously - turn off backups
set nobackup
set nowritebackup
set noswapfile

" Don't warn about unsaved buffers
set hidden

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set autoindent
set copyindent

" Use host OS clipboard
set clipboard=unnamed

" MiniBufExplorer setup
let g:statusLineText=''
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplUseSingleClick=1
let g:miniBufExplForceSyntaxEnable=1

" CtrlP setup
let g:ctrlp_clear_cache_on_exit = 1

" GUI setup
if has('gui_running')
  if has("win32") || has("win16")
    set guifont=Inconsolata:h12
  else
    set guifont=Inconsolata:h15
  endif

  " Remove left and right scrollbars
  set guioptions-=L
  set guioptions-=r

" Terminal setup
else
  set t_Co=256
endif

