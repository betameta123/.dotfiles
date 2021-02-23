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
let fortran_have_tabs=1
setlocal spell
set spelllang=nl,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Keybinds
inoremap jj <Esc>
let mapleader = "\<space>"

nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
vnoremap > >gv
vnoremap < <gv
vnoremap <leader>cc <leader>ccgv
