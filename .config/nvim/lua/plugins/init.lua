return {
	  -- LSP
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {'hrsh7th/nvim-cmp'},

    config = function()
      require "plugins.configs.lsp"
    end
  },

  {
    "folke/tokyonight.nvim",
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme tokyonight-night')
    end,
    opts = {},
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'InsertEnter',
    dependencies = {
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      {
        'L3MON4D3/LuaSnip',
        config = function()
          require 'plugins.configs.luasnip'
        end
      },
      {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      }
    },
  },

  -------------------------------------------------------------------------------
  -- Type Faster

  {
    'tpope/vim-surround',
  },

  {
    'tpope/vim-repeat',
  },

  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  {
    'mg979/vim-visual-multi',
  },

  {
    'numToStr/Comment.nvim',
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
  },

  -------------------------------------------------------------------------------
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = "BufReadPre",
    build = ':TSUpdate',
    config = function()
      require('plugins.configs.treesitter')
    end
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    event = "BufReadPre",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('plugins.configs.tree-textobjects')
    end
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
    event = "BufReadPre",
    config = function()
      require('plugins.configs.tree-context')
    end
  },

  -------------------------------------------------------------------------------
  -- Navigation
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    keys = {
      {"<leader>nf", function() require('telescope.builtin').find_files() end, },
      {"<leader>nb", function() require('telescope.builtin').buffers() end, },
      {"<leader>n/", function() require('telescope.builtin').live_grep() end, },
      {"<leader>nr", function() require('telescope.builtin').lsp_references() end, },
    },
    config = function ()
      require('plugins.configs.telescope')
    end,
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    lazy = true,
    dependencies = {
      {'nvim-telescope/telescope.nvim'}
    },
    keys = {
      { "<leader>nn",  ":Telescope file_browser<CR>"},
      { "<leader>nc",  ":Telescope file_browser path=$XDG_CONFIG_HOME/nvim<CR>"},
      { "<leader>nN",  ":Telescope file_browser path=~/Documents/My-Notes/notes<CR>"},
    },
  },

  -- git
  {
    'tpope/vim-fugitive',
    lazy = true,
    cmd = { "Git", "G" },
  },

  -------------------------------------------------------------------------------
  -- Notes
  {
    'lervag/vimtex',
    lazy = true,
    ft = 'tex',
    config = function ()
      require('plugins.configs.vimtex')
    end
  },

   {
     "vhyrro/luarocks.nvim",
     lazy = true,
     config = true,
   },

  {
    "nvim-neorg/neorg",
    lazy = true,
    ft = "norg",
    cmd = {"Neorg"},
     -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
             icon_preset = "diamond",
            },
          }, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/My-Notes/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.summary"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      }
    end,
  },

  {
    'jbyuki/nabla.nvim',
    lazy = true,
    keys = {
      {"<leader>p", function() vim.keymap.set("n", "<leader>p", ":lua require(\"nabla\").popup()<CR>\" Customize with popup({border = ...})  : `single` (default), `double`, `rounded`") end },
    },
  },

  -------------------------------------------------------------------------------
  -- Aesthetic
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    dependencies = { {'kyazdani42/nvim-web-devicons', lazy = true} }
  },

}
