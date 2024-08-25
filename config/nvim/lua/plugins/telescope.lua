-- Telescope
return {
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.8',
		dependencies = { 
				'nvim-lua/plenary.nvim',
				"nvim-lua/popup.nvim",
				"kyazdani42/nvim-web-devicons"
		},
		config = function()
			require("../configs.telescope")
		end
}
