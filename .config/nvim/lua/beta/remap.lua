vim.keymap.set("n", "Y", "$y")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- kim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")

vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-;>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-n>", ":topleft vs .<CR>")
vim.keymap.set("n", "<leader>l", "<c-w>l")
vim.keymap.set("n", "<leader>h", "<c-w>h")
vim.keymap.set("n", "<leader>j", "<c-w>j")
vim.keymap.set("n", "<leader>k", "<c-w>k")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader><C-j>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader><C-j>", "<cmd>lprev<CR>zz")

