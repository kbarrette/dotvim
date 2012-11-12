" Look and feel
colorscheme Sunburst
set guifont=Inconsolata:h15
filetype plugin indent on
syntax on

" Use pathogen to wrangle runtimepath so everything in bundle/ is included
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
