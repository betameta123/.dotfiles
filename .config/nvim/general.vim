set mouse=a
set clipboard+=unnamedplus
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set noswapfile
set nobackup

"Line numbers
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd InsertLeave * if (!exists("b:NERDTree")) | set relativenumber | endif
    autocmd InsertEnter * if (!exists("b:NERDTree")) | set norelativenumber | endif
augroup END

let g:go_highlight_trailing_whitespace_error=0
map <C-l> :set number relativenumber<CR>
let fortran_have_tabs=1


"Keybinds
inoremap jj <Esc>
let mapleader = "\<space>"

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
vnoremap > >gv
vnoremap < <gv
