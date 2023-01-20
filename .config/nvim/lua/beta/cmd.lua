local templates = vim.api.nvim_create_augroup("templates", {
    clear = true
})

vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = {"*.tex"},
    command = "read ~/.config/nvim/templates/skeleton.tex | 0norm dd",
    group = "templates"
})

vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = {"*.sh"},
    command = "read ~/.config/nvim/templates/skeleton.sh | 0norm dd",
    group = "templates"
})

vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = {"*.html"},
    command = "read ~/.config/nvim/templates/skeleton.html | 0norm dd",
    group = "templates"
})

vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = {"*.py"},
    command = "read ~/.config/nvim/templates/skeleton.py | 0norm dd",
    group = "templates"
})

vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = {"*.c"},
    command = "read ~/.config/nvim/templates/skeleton.c | 0norm dd",
    group = "templates"
})

-- autocmd BufRead,BufNewFile latex,tex,md,markdown,text,txt setlocal spell
vim.api.nvim_create_autocmd({"BufRead"}, {
  pattern = {"*.tex, *.md, *.txt"},
  callback = function() vim.opt_local.spell = true end,
})
