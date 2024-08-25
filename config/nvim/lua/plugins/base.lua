return {
		-- Lualine
		{
			'nvim-lualine/lualine.nvim',
		  dependencies = { 'nvim-tree/nvim-web-devicons' }
		},
		-- Gruvbox
		{ 
				"ellisonleao/gruvbox.nvim", 
				priority = 1000 , 
				config = true
		},
		{
				"nvim-telescope/telescope-file-browser.nvim",
				dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
		},
		{
				'ThePrimeagen/harpoon',
				dependencies = {"nvim-lua/plenary.nvim"},
				config = function()
						require('../configs.harpoon')
				end
		}
}
