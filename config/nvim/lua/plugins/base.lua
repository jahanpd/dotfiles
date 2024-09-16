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
				'ThePrimeagen/harpoon',
				dependencies = {"nvim-lua/plenary.nvim"},
				config = function()
						require('../configs.harpoon')
				end
		}
}
