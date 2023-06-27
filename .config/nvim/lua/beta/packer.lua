-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

-------------------------------------------------------------------------------
-- LSP
      -- LSP Support
  use 'neovim/nvim-lspconfig'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  use 'mfussenegger/nvim-jdtls'

-------------------------------------------------------------------------------
-- Type Faster
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  use 'tpope/vim-surround'

  use 'tpope/vim-repeat'

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use 'mg979/vim-visual-multi'

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

-------------------------------------------------------------------------------
-- Treesitter
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use 'nvim-treesitter/nvim-treesitter-context'

-------------------------------------------------------------------------------
-- Navigation
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use 'sindrets/winshift.nvim'


-------------------------------------------------------------------------------
-- git
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

-------------------------------------------------------------------------------
-- Notes
  use 'lervag/vimtex'
  use 'vimwiki/vimwiki'

-------------------------------------------------------------------------------
-- Aesthetic
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
--   use({
--     'rose-pine/neovim',
--     as = 'rose-pine',
--     config = function()
--         require("rose-pine").setup()
--         vim.cmd('colorscheme rose-pine')
--     end
-- })
  use({ 
    'catppuccin/nvim',
    as = "catppuccin",
    config = function()
      vim.cmd('colorscheme catppuccin')
    end
  })
  
  use "folke/zen-mode.nvim"
  use 'norcalli/nvim-colorizer.lua'

end)
