-- Using Lua functions
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, {desc = "find files with telescope"})
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, {desc = "search files with grep telescope"})
vim.keymap.set('n', '<leader>fv', function() require('telescope.builtin').buffers() end, {desc = "find buffer with telescope"})
vim.keymap.set('n', '<leader>fb', ":Telescope file_browser <CR>", opts)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, {desc = "search through help tags with telescope"})
vim.keymap.set('n', '<leader>fk', function() require('telescope.builtin').keymaps() end, {desc = "search keymaps from normal mode with telescope"})

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
	find_files = { hidden = true }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
		file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  }
}
require("telescope").load_extension "file_browser"
