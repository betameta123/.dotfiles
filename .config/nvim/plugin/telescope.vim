" Find files using Telescope command-line sugar.
"
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<CR>

nnoremap <leader>fs :lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>fc :lua require('beta.telescope').search_dotfiles()<CR>
