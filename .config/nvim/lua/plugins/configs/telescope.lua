local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nf', builtin.find_files, {})
vim.keymap.set('n', '<leader>nb', builtin.buffers, {})
vim.keymap.set('n', '<leader>n/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>nr', builtin.lsp_references, {})

require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap('n', '<space>nn', ':Telescope file_browser<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>nc', ':Telescope file_browser path=$XDG_CONFIG_HOME/nvim<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>nN', ':Telescope file_browser path=~/Documents/My-Notes/notes<CR>', { noremap = true })
