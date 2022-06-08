local opts = { noremap=true, silent=true }

-- TAB in general mode will move to text buffer
vim.keymap.set('n', '<TAB>', '<C-^>', opts)

--SHIFT-TAB will cycle through
vim.keymap.set('n', '<S-TAB>', function() vim.api.nvim_command('bnext') end, opts)

-- quick close of buffer
vim.keymap.set('n', 'Q', function() vim.api.nvim_command('bdelete') end, opts)
vim.keymap.set('n', '<C-Q>', function() vim.api.nvim_command('bdelete!') end, opts)

-- Use control-c instead of escape
vim.keymap.set('n', '<C-c>', '<Esc>', opts)

-- Telescope remaps in telescope.lua

-- Harpoon remaps in Harpoon.lua

-- LSP Mappings in lsp.lua

