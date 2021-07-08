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
inoremap jj <Esc>
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
