-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

-------------------------------------------------------------------------------
-- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
	  }
  }
use 'mfussenegger/nvim-jdtls'

-------------------------------------------------------------------------------
-- Type Faster
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

-- Is using a standard Neovim install, i.e. built from source or using a
-- provided appimage.
use {
  'lewis6991/impatient.nvim',
  config = function ()
    require('impatient')
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
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
    end
})

  use "folke/zen-mode.nvim"
  use 'norcalli/nvim-colorizer.lua'

end)
