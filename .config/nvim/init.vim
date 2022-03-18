call plug#begin('~/.local/share/nvim/plugged')

" Auto Complete
Plug 'neovim/nvim-lspconfig'
Plug 'SirVer/ultisnips'
Plug 'brymer-meneses/grammar-guard.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

"formating
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'bluz71/vim-nightfly-guicolors'

"Notes
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'vimwiki/vimwiki'

"File
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ElPiloto/telescope-vimwiki.nvim'

"Coding
Plug 'simrat39/rust-tools.nvim'

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set breakindent
set scrolloff=4

"Line numbers
set number relativenumber

"splitting
set splitbelow
set splitright

"Spell Check
set encoding=UTF-8
setlocal spell
set spelllang=nl,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"delimate
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 2

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


nnoremap cw *``cgn
nnoremap cW *``cgN

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" inoremap <c-j> <esc>:m .+1<cr>==gi
" inoremap <c-k> <esc>:m .-2<cr>==gi

nnoremap <leader>ll :LLPStartPreview<CR>

let g:livepreview_previewer = 'zathura'


let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

source $HOME/.config/nvim/barcolor.vim
source $HOME/.config/nvim/plugin/markdown-preview.vim
source $HOME/.config/nvim/plugin/lsp.vim
source $HOME/.config/nvim/plugin/telescope.vim
source $HOME/.config/nvim/plugin/rust.vim
source $HOME/.config/nvim/plugin/vimwiki.vim
lua require('beta.lsp')
lua require('beta.telescope')
source $HOME/.config/nvim/commands.vim
