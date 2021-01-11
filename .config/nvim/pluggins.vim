call plug#begin('~/.local/share/nvim/plugged') 

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

"formating
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'

" Theming and colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cocopon/iceberg.vim/'

"Notes
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'

"Movement
Plug 'easymotion/vim-easymotion'


call plug#end()

