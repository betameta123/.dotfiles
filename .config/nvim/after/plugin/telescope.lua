local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nf', builtin.find_files, {})
vim.keymap.set('n', '<leader>Nf', builtin.git_files, {})
vim.keymap.set('n', '<leader>n/', builtin.live_grep, {})

