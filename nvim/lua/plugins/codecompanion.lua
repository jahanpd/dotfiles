return {
		{
			"olimorris/codecompanion.nvim",
			version = "^19.0.0",
			opts = {},
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" }
		},
		{
			"HakonHarnes/img-clip.nvim",
			opts = {
				filetypes = {
					codecompanion = {
						prompt_for_file_name = false,
						template = "[Image]($FILE_PATH)",
						use_absolute_path = true,
					},
				},
			},
		},
		-- Configure in your setup
		require("codecompanion").setup({
			extensions = {
				history = {
					enabled = true, -- defaults to true
					opts = {
						dir_to_save = vim.fn.stdpath("data") .. "/codecompanion_chats.json",
					}
				}
			}
		})
}
