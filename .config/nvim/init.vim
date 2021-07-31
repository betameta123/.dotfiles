call plug#begin('~/.local/share/nvim/plugged')

" Auto Complete
Plug 'neovim/nvim-lspconfig'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'SirVer/ultisnips'

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
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'

"Movement
Plug 'justinmk/vim-sneak'

"File
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"-------------------------------------------------------------------------------
"Set
set mouse=a
set clipboard+=unnamedplus
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set noswapfile
set nobackup
set nowrap
set colorcolumn=80
set splitbelow
set splitright
set encoding=UTF-8

set shortmess+=c

"Line numbers
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd InsertLeave * if (!exists("b:NERDTree")) | set relativenumber | endif
    autocmd InsertEnter * if (!exists("b:NERDTree")) | set norelativenumber | endif
augroup END

"Spell Check
setlocal spell
set spelllang=nl,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"delimate
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 2

"better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_skip_empty_lines=1
let g:strip_whitelines_at_eof=1

"NERDTree
let g:NERDTreeWinSize = 20

"Keybinds
inoremap ii <Esc>
let mapleader = "\<space>"

nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
vnoremap > >gv
vnoremap < <gv

nnoremap <leader>n :NERDTreeToggle<CR>

"Grammarous
nmap <c-x> <Plug>(grammarous-move-to-info-window)
nmap <c-q> <Plug>(grammarous-close-info-window)
nmap <c-f> :GrammarousCheck<CR>
nmap <leader>fg (grammarous-fixit)<CR>
nmap <c-n> <Plug>(grammarous-move-to-next-error)
nmap <c-p> <Plug>(grammarous-move-to-previous-error)

nnoremap <leader>ll :!kitty latexmk -pvc % &<CR>

"Config
nnoremap <leader>evc :e ~/.config/nvim/general.vim<CR>
nnoremap <leader>elc :e ~/texmf/tex/latex/beta/beta.sty<CR>

let g:UltiSnipsExpandTrigger = "<C-n>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

source $HOME/.config/nvim/barcolor.vim
source $HOME/.config/nvim/plugin/markdown-preview.vim
source $HOME/.config/nvim/plugin/latex.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/lua/lsp.lua
source $HOME/.config/nvim/plugin/lsp.vim
