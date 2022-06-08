-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
		requires = {
			"p00f/nvim-ts-rainbow",
		},
		run = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
  }

  -- LSP with Coc
  use {
	"neoclide/coc.nvim",
	branch = 'release'
  }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua"
  }

  use {
    'vim-pandoc/vim-pandoc',
    requires = { 'vim-pandoc/vim-pandoc-syntax'}
  }

  use {
    'tpope/vim-commentary'
  }

  use {
    'tpope/vim-surround',
  }

  use {
    'folke/zen-mode.nvim',
  }

  -- themes
  use {
    'gruvbox-community/gruvbox',
  }

  -- Telescope (Fuzzy finding)
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("configs.telescope")
		end,
	})

  -- Harpoon
	use({
		'ThePrimeagen/harpoon',
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("configs.harpoon")
		end,
	})

end)
