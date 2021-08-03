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

augroup ChangeClass
    autocmd VimEnter *.tex silent! exec "!xdotool getactivewindow set_window --class texz"
    autocmd Vimleave *.tex silent! exec "!xdotool getactivewindow set_window --class kitty"
augroup END

augroup LspSage
    autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()
    autocmd CursorHoldI * silent! lua require('lspsaga.signaturehelp').signature_help()
augroup END


