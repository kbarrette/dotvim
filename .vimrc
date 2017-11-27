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
nnoremap <leader>r :update<CR>

" Delete buffers
nnoremap <leader>bd :bd<CR>


" -----------------
" Plugin management
" -----------------

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-operator-replace' | Plug 'kana/vim-operator-user'
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/BufOnly.vim'
Plug 'w0rp/ale'
call plug#end()
runtime macros/matchit.vim


" -------------------------------
" Plugin customizations and setup
" -------------------------------
let g:ackprg = 'ag --vimgrep -W80'
let g:ack_autoclose = 1

" vim-gitgutter setup
set signcolumn=yes
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete DiffChange

" vim-airline setup
set noshowmode
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" YouCompleteMe setup
let g:ycm_complete_in_comments_and_strings = 1

" vim-operator-replace setup
map gr <Plug>(operator-replace)

" scratch setup
let g:scratch_filetype = 'markdown'
let g:scratch_autohide = 0
let g:scratch_insert_autohide = 0
let g:scratch_horizontal = 0
let g:scratch_height = 80

" Easymotion setup
map <Leader>s <Plug>(easymotion-s)
map <Leader>S <Plug>(easymotion-S)
map <Leader>f <Plug>(easymotion-f)
map <Leader>F <Plug>(easymotion-F)
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>e <Plug>(easymotion-bd-e)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" FZF setup
nnoremap <C-P> :FZF<CR>
nnoremap <C-L> :Buffers<CR>


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
" set relativenumber
" autocmd InsertEnter * :set number | set norelativenumber
" autocmd InsertLeave * :set relativenumber | set nonumber

" Highlight cursor line
set cursorline

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

" Show $ at end of change
" set cpoptions+=$

" Fenced markdown languages
let g:markdown_fenced_languages = ['erb=eruby', 'javascript', 'json=javascript', 'ruby', 'html']

" 4-space Java indent
au FileType java setlocal shiftwidth=4 tabstop=4

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


" -----------
" Experiments
" -----------

set breakindent
set colorcolumn=80
set splitbelow
set splitright
set nohlsearch
nnoremap <silent> <C-J> :wincmd w<CR>
nnoremap <silent> <C-K> :wincmd W<CR>

set tags=.tags
set path=.

nnoremap <silent> <C-N> :set relativenumber<CR>:sleep 500m <bar> set norelativenumber<CR>
augroup HiglightTODO
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

" Terminal setup
if has('nvim')
  " function! TermSplit()
  "   vsp term://bash
  "   file Terminal
  "   startinsert!
  " endfunction
  " command! -register TermSplit call TermSplit()

  " function! s:moveToWindow(direction)
  "   stopinsert
  "   execute "wincmd" a:direction
  "
  "   if &buftype == 'terminal'
  "     startinsert!
  "   endif
  " endfunc

  " highlight TermCursor ctermfg=red guifg=red
  " nnoremap <silent> <C-J> :call <SID>moveToWindow("w")<CR>
  " nnoremap <silent> <C-K> :call <SID>moveToWindow("W")<CR>

  " tnoremap <silent> <C-J> <C-\><C-n>:call <SID>moveToWindow("w")<CR>
  " tnoremap <silent> <C-K> <C-\><C-n>:call <SID>moveToWindow("W")<CR>
  tnoremap <silent> <Leader><ESC> <C-\><C-n>
  tnoremap <silent> <Esc> <C-\><C-n>
endif

