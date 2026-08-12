-- ADAPTERS FOR AI INFERENCE
local openrouter = function()
      return require("codecompanion.adapters").extend("openrouter", {
        env = {
          -- pick one:
          api_key = "file:~/Sync/keys/openrouter",
          -- api_key = "MY_CUSTOM_VAR_NAME",
        },
        schema = {
          model = { default = "deepseek/deepseek-v4-flash-0731" },
        },
      })
    end

local adapters = {
		http = {
				openrouter = openrouter
		}
}
-- OPTIONS
local opts = {
		adapters = adapters,
    interactions = {
      chat = {
        adapter = "openrouter",
        model = "deepseek/deepseek-v4-flash-0731"
      },
			inline = {
        adapter = "openrouter",
        model = "deepseek/deepseek-v4-flash-0731"
			},
		  cmd = {
        adapter = "opencode",
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG",
    },
}

return {
		{
			"olimorris/codecompanion.nvim",
			version = "^19.0.0",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			opts = opts
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
		}
}
