-- ~/.config/nvim/lua/plugins/avante.lua
--
-- Two kinds of provider here, and they behave differently:
--
--   providers      -> HTTP APIs driven by Avante's own Lua agent loop
--                     (lua/avante/llm.lua). Avante owns the tools, the
--                     prompts and the permission model.
--
--   acp_providers  -> external agent processes over JSON-RPC on stdio.
--                     No endpoint, no model, no api_key_name. The agent
--                     owns its own auth, tools, context and loop; Avante
--                     is just the client. `disabled_tools`, `custom_tools`
--                     and `auto_approve_tool_permissions` do NOT apply.
--
-- OPENROUTER_API_KEY comes from load_key() in init.lua.

--------------------------------------------------------------------------
-- HTTP providers
--------------------------------------------------------------------------

---@type table<string, table>
local providers = {
  openrouter = {
    __inherited_from = "openai",
    endpoint = "https://openrouter.ai/api/v1",
    api_key_name = "OPENROUTER_API_KEY",
    model = "deepseek/deepseek-v4-flash-0731",
    model_names = {
      "moonshotai/kimi-k3",
			"deepseek/deepseek-v4-flash-0731",
			"deepseek/deepseek-v4-pro-0813"
    },
    -- Suppress the inherited remote /models fetch; OpenRouter returns
    -- several hundred entries and floods the picker.
    list_models = false,
    timeout = 30000,
    extra_request_body = {
      temperature = 0.75,
      max_tokens = 20480,
    },
  },

  -- Cheap model for auto-suggestions. Hidden from :AvanteModels.
  -- Auto-suggestions always use the native path, never ACP.
  ["openrouter-fast"] = {
    __inherited_from = "openai",
    endpoint = "https://openrouter.ai/api/v1",
    api_key_name = "OPENROUTER_API_KEY",
    model = "deepseek/deepseek-v4-flash-0731",
    list_models = false,
    hide_in_model_selector = true,
    timeout = 30000,
    extra_request_body = {
      temperature = 0.2,
      max_tokens = 4096,
    },
  },
}

--------------------------------------------------------------------------
-- ACP providers
--
-- Every binary below must be on PATH when nvim starts. :checkhealth avante
--------------------------------------------------------------------------

---@type table<string, table>
local acp_providers = {
  -- Claude Code. Reuses the credentials from `claude login` in ~/.claude,
  -- so a Pro/Max subscription needs nothing passed in.
  -- ANTHROPIC_API_KEY is deliberately NOT forwarded (the shipped default
  -- does forward it) -- that would divert to metered API billing.
  -- Shipped default for ACP_PERMISSION_MODE is "bypassPermissions", which
  -- auto-approves file writes and shell commands with no prompt.
  -- NOTE: avante does NOT inherit the parent environment for ACP agents.
  -- acp_client.lua builds a fresh env containing only PATH plus this table
  -- and passes it to uv.spawn, which *replaces* the environment. On macOS
  -- the credentials are a Keychain generic password (service
  -- "Claude Code-credentials", account $USER), so dropping USER makes every
  -- session/prompt fail with "Authentication required".
  ["claude-code"] = {
    command = "claude-agent-acp",
    args = {},
    env = {
      NODE_NO_WARNINGS = "1",
      HOME = os.getenv("HOME"),
      USER = os.getenv("USER"),
      PATH = os.getenv("PATH"),
    },
  },

  -- OpenCode. Permissions configured in ~/.config/opencode, not here.
  ["opencode"] = {
    command = "opencode",
    args = { "acp" },
    env = {
      HOME = os.getenv("HOME"),
      PATH = os.getenv("PATH"),
    },
  },

  -- Pi. The agent doesn't speak ACP natively; pi-acp is a separate
  -- adapter that spawns it. Settings live in ~/.pi/agent/settings.json.
  ["pi"] = {
    command = "pi-acp",
    args = {},
    env = {
      NODE_NO_WARNINGS = "1",
      HOME = os.getenv("HOME"),
      PATH = os.getenv("PATH"),
    },
  },

  -- DeepSeek Harness. Needs Node >= 22 (dsh uses Promise.withResolvers
  -- and node:zlib zstd streams; older Node fails at boot with unhelpful
  -- errors). Credentials come from ~/.dsh/.credentials.yaml -- set them
  -- via the dsh web UI or `dsh-acp login`, not from this file.
  ["deepseek"] = {
    command = "dsh-acp",
    args = {},
    env = {
      NODE_NO_WARNINGS = "1",
      HOME = os.getenv("HOME"),
      PATH = os.getenv("PATH"),
    },
  },
}

--------------------------------------------------------------------------
-- Plugin spec
--------------------------------------------------------------------------

return {
  "yetone/avante.nvim",
	build = "bash build.sh",
  event = "VeryLazy",
  version = "*",
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- Name lookup spans both tables; :AvanteSwitchProvider completes across
    -- claude-code / opencode / pi / deepseek / openrouter.
    provider = "claude-code",
    auto_suggestions_provider = "openrouter-fast",
    mode = "agentic",

    providers = providers,
    acp_providers = acp_providers,

    instructions_file = "avante.md",

    behaviour = {
      auto_suggestions = false,
      auto_apply_diff_after_generation = false,
      -- Native path only. Shipped default is `true` = approve everything.
      auto_approve_tool_permissions = { "read_file", "glob", "search_keyword" },
      acp_follow_agent_locations = true,
      minimize_diff = true,
      enable_token_counting = true,
    },

    windows = {
      position = "right",
      width = 35,
      sidebar_header = { include_model = true },
      input = { prefix = "> ", height = 8 },
    },

    -- Default keymaps are set automatically under <leader>a and skip any
    -- lhs lazy.nvim has already claimed. Rebind via a `mappings = {}` table
    -- here rather than vim.keymap.set.
    selector = { provider = "native" },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}
