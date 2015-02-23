" Be iMproved!
set nocompatible

set shell=/bin/sh

" ------------------
" Custom keybindings
" ------------------

" Keybindings
let mapleader=" "
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Set up tab to switch to last used buffer
nnoremap <Tab> :b#<CR>

" Select pasted text
nnoremap gp `[v`]

" Ctrl-S saves
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Delete buffers
nnoremap <leader>bd :bd<CR>

" Navigate splits with leader
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>


" -----------------
" Plugin management
" -----------------

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'tpope/vim-repeat'
Bundle 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mhinz/vim-signify'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'kana/vim-operator-replace'
Bundle 'kana/vim-operator-user'
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'vim-scripts/scratch.vim'
Bundle 'FelikZ/ctrlp-py-matcher'

" -------------------------------
" Plugin customizations and setup
" -------------------------------

" vim-airline setup
set noshowmode
let g:airline_theme = 'powerlineish'
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts = 1

" CtrlP setup
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --other --exclude-standard']
" let g:ctrlp_use_caching = 0
" let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
nnoremap <C-L> :CtrlPBuffer<CR>

" YouCompleteMe setup
let g:ycm_complete_in_comments_and_strings = 1

" vim-operator-replace setup
map gr <Plug>(operator-replace)

" ----------------------------
" Colors, display options, etc
" ----------------------------

" Make paren matching more subtle, Syntastic errors match other errors, Todo more prominent
let g:jellybeans_overrides = {
\  'MatchParen': { 'guifg': 'ffffff', 'ctermfg': '231', 'attr': 'underline,bold' },
\  'SyntasticError': { 'guibg': '902020', 'ctermbg': 'DarkRed' },
\  'Todo': { 'attr': 'reverse,bold' },
\}
colorscheme jellybeans

" Enable filetype-specific plugins and indenting
filetype plugin indent on

" Syntax highlighting on
syntax on

" Show line number
set number

" Show row and column
set ruler

" Set encoding to a sensible UTF-8
set encoding=utf-8

" Always show status line
set laststatus=2

" Show some info about the current command
set showcmd

" Speed up big files
set synmaxcol=1024

" Don't continue comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" GUI setup
if has('gui_running')
  if has("win32") || has("win16")
    set guifont=Inconsolata:h12
  else
    set guifont=Inconsolata\ for\ Powerline:h15

  endif

  " Remove left and right scrollbars
  set guioptions-=L
  set guioptions-=r

" Terminal setup
else
  set t_Co=256
endif


" --------------------
" General vim behavior
" --------------------

" Use host OS clipboard
set clipboard=unnamed

" Ignore case in searches unless there are upper-case characters in the search
set ignorecase
set smartcase

" Search incrementally
set incsearch

" Use wildmenu
set wildmenu
set wildmode=list:longest

" Live dangerously - turn off backups
set nobackup
set nowritebackup
set noswapfile

" Don't warn about unsaved buffers
set hidden

" Whitespace
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2
set copyindent
set nowrap


" ---------------
" Custom commands
" ---------------

" Retain window position when switching buffers
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Highlight extraneous whitespace
autocmd BufWinEnter * match Error /\s\+$/
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Reformat entire file
nnoremap <leader>fa ggVG=

" Reformat paragraph
nnoremap <leader>fp vap=

" Bufonly
nnoremap <leader>bo :Bufonly<CR>

