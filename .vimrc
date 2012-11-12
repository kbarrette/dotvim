" Look and feel
colorscheme Sunburst
set guifont=Inconsolata:h15
filetype plugin indent on
syntax on
set number

" Use pathogen to wrangle runtimepath so everything in bundle/ is included
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" MiniBufExplorer keyboard setup
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
