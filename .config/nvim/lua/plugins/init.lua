return {

	-- LSP
	{
    'neovim/nvim-lspconfig',
    dependencies = {'hrsh7th/nvim-cmp'},

    config = function()
      require "plugins.configs.lsp"
    end
	},

	{
		'rose-pine/neovim',
		name = 'rose-pine',
    priority = 1000,
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	},

  -- Autocompletion
  {
		'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("plugins.configs.luasnip")
        end,
      },

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
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      }
    },
  },

  {
		'mfussenegger/nvim-jdtls',
    ft = "java"
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
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  {
		'mg979/vim-visual-multi',
  },

  {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end,
  },

-------------------------------------------------------------------------------
-- Treesitter
  {
	  'nvim-treesitter/nvim-treesitter',
	  build = ':TSUpdate',
    config = function()
      require('plugins.configs.treesitter')
    end
  },

  {
      'nvim-treesitter/nvim-treesitter-textobjects',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('plugins.configs.tree-textobjects')
      end
  },

  {
		'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('plugins.configs.tree-context')
    end
  },


-------------------------------------------------------------------------------
-- Navigation

  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      {
        'nvim-telescope/telescope.nvim',
        dependencies = {
        'nvim-lua/plenary.nvim'
        },
        config = function ()
          require('plugins.configs.telescope')
        end
      }
    }
  },

-- git
  {
    'tpope/vim-fugitive',
    lazy = true
  },

  {
    'lewis6991/gitsigns.nvim',
  },

-------------------------------------------------------------------------------
-- Notes
  {
    'lervag/vimtex',
    ft = 'vim'
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
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
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      }
    end,
  },

-------------------------------------------------------------------------------
-- Aesthetic
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { {'kyazdani42/nvim-web-devicons', lazy = true} }
  },

  {
    'norcalli/nvim-colorizer.lua'
  }

}
