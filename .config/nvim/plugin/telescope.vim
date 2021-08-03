" Find files using Telescope command-line sugar.
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<CR>

nnoremap <leader>fs :lua require('beta.telescope').grep_prompt()<CR>
nnoremap <leader>nn :lua require('beta.telescope').file_explorer()<CR>
nnoremap <leader>n :lua require('beta.telescope').path_explorer()<CR>
nnoremap <leader>fv :lua require('beta.telescope').search_dotfiles()<CR>
nnoremap <leader>fn :lua require('beta.telescope').find_notes()<CR>
