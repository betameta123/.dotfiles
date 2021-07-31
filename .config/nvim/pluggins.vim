call plug#begin('~/.local/share/nvim/plugged')

" Auto Complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

"formating
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cocopon/iceberg.vim/'
Plug 'psliwka/vim-smoothie'

"Notes
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'

"Movement
Plug 'justinmk/vim-sneak'

"File
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()
