call plug#begin('~/.local/share/nvim/plugged') 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'power/fonts'
Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'cocopon/iceberg.vim/'
Plug 'arcticicestudio/nord-vim'
Plug 'skammer/vim-css-color'
call plug#end()

