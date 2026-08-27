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
		  -- for the basic chat interface
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
			cli = {
					agent = "opencode",
					agents = {
							opencode = {
									cmd = "opencode",
									args = {},
									description = "Opencode CLI",
									provider = "terminal",
							},
					},
			},
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG",
    },
    -- MCP SERVERS
		mcp = {
				servers = {
					-- The function is called once, only when the server is first needed.
					["mimic"] = function()
						return {
							cmd = {
									"/run/current-system/sw/bin/uv",
									"run",
									"--directory", "/Users/jahan/Sync/mcp/mimiciv",
									"mimic-mcp",
							},
							env = {
								GCP_PROJECT_ID = "auspicious-silo-247823"
							},
						}
					end,
			},
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
