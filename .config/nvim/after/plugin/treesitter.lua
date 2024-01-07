require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { 
      "c", 
      "lua", 
      "vim", 
      "help", 
      "python", 
      "haskell", 
      "go",
      "latex", 
      "java",
      "javascript",
      "typescript",
      "json",
      "yaml",
      "css",
      "markdown",
      "markdown_inline"
      },
    
  indent = { enable = true },
  highlight = {
    enable = true,
    disable = { "latex" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,
  },

  incremental_selection = {
      enable = true,
      keymaps = {
          init_selection = "<C-l>",
          node_incremental = "<C-l>",
          scope_incremental = false,
          node_decremental = "<bs>",
      },
  }
}
