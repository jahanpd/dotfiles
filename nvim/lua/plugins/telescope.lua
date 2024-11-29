-- Telescope
return { 
		{
				"nvim-telescope/telescope-file-browser.nvim",
				dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
		},
		{
				'nvim-telescope/telescope.nvim', 
				tag = '0.1.8',
				dependencies = { 
						'nvim-lua/plenary.nvim',
						"nvim-lua/popup.nvim",
						"kyazdani42/nvim-web-devicons"
				},
				config = function()
					require("../configs.telescope")
				  require("telescope").load_extension "file_browser"
				end
		}
}
