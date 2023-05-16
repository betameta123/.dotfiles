local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nf', builtin.find_files, {})
vim.keymap.set('n', '<leader>n/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>nb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>nc', builtin.git_commits, {})

