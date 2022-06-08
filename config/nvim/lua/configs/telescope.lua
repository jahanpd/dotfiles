-- Using Lua functions
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, opts)
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, opts)
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffer() end, opts)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, opts)


