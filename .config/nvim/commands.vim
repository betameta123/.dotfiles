if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh read ~/.config/nvim/templates/skeleton.sh |
                    \ set syntax=sh |
                    \ set filetype=sh |
                    \ 0norm dd
		autocmd BufNewFile *.tex read ~/.config/nvim/templates/skeleton.tex |
                    \ set syntax=tex |
                    \ set filetype=tex |
                    \ 0norm dd
        autocmd BufNewFile *.py read ~/.config/nvim/templates/skeleton.py |
                    \ set syntax=python |
                    \ set filetype=python |
                    \ 0norm dd
	augroup END

	augroup numbertoggle
		autocmd!
		autocmd InsertLeave * if (!exists("b:NERDTree")) | set relativenumber | endif
		autocmd InsertEnter * if (!exists("b:NERDTree")) | set norelativenumber | endif
	augroup END

	" automatically quit nerdtree if last
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

	if has_key(plugs, 'coc.nvim')
		" Highlight the symbol and its references when holding the cursor.
		autocmd CursorHold * silent call CocActionAsync('highlight')
	endif

	" automatically open nerdtree if opening a directory
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

	augroup asy_ft
		autocmd!
		autocmd BufNewFile,BufRead *.asy set syntax=asy
	augroup END
endif

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup WhiteSpace
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
