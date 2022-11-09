call plug#begin('~/.local/share/nvim/plugged')

" Auto Complete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'Raimondi/delimitMate'
"
"formating
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'bluz71/vim-nightfly-guicolors'

"Notes
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'
Plug 'renerocksai/calendar-vim'
Plug 'renerocksai/telekasten.nvim'

"fuzzy finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

"Programming
Plug 'mfussenegger/nvim-jdtls'

call plug#end()

"-------------------------------------------------------------------------------
"Set
set mouse=a
set clipboard+=unnamedplus
set nohlsearch
set noswapfile
set nobackup
set nowrap
set colorcolumn=80
set updatetime=300
set shortmess+=c

"Spacing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set breakindent
set smartindent
set scrolloff=4

"Line numbers
set number relativenumber

"splitting
set splitbelow
set splitright

"Spell Check
setlocal spell
set spelllang=nl,en_us
inoremap <C-;> <c-g>u<Esc>[s1z=`]a<c-g>u

"-------------------------------------------------------------------------------

"Keybinds

let mapleader = "\<space>"

nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

nnoremap Q <nop>

nnoremap Y $y

nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>

vnoremap > >gv
vnoremap < <gv

nnoremap n nzzzv
nnoremap N Nzzzv

"Jump through quick fix list
nnoremap <c-j> :cn<CR>zzzv
nnoremap <c-k> :cp<CR>zzzv

let delimitMate_expand_cr = 1

nnoremap cw *``cgn
nnoremap cW *``cgN

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

source $HOME/.config/nvim/barcolor.vim
source $HOME/.config/nvim/plugin/markdown-preview.vim
source $HOME/.config/nvim/plugin/lsp.vim
lua require('beta.lsp')
lua require('beta.luasnip')
lua require('beta.tree-context')
lua require('beta.telekasten')
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/plugin/telekasten.vim
