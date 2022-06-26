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
-- Change scroll half down to ctrl shift U
vim.keymap.set('n', '<S-k>', '<C-u>', opts)
vim.keymap.set('n', '<S-j>', '<C-d>', opts)

-- Movement remap in insert mode
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-b>', '<Esc>bi', opts)
vim.keymap.set('i', '<C-w>', '<Esc>wa', opts)
vim.keymap.set('i', '<C-e>', '<Esc>ea', opts)

-- Telescope remaps in telescope.lua

-- Harpoon remaps in Harpoon.lua

-- LSP Mappings in lsp.lua

