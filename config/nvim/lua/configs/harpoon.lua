-- Harpoon

vim.keymap.set('n', '<leader>hm', function() require("harpoon.mark").add_file() end, opts)
vim.keymap.set('n', '<leader>hh', function() require("harpoon.ui").toggle_quick_menu() end, opts)

local harpoonremap = function(mapping, remap)
  vim.keymap.set('n', mapping, function() require("harpoon.ui").nav_file(num) end, opts)
end

harpoonremap('<C-a>', 1)
harpoonremap('<C-l>', 2)
harpoonremap('<C-s>', 3)
harpoonremap('<C-k>', 4)
harpoonremap('<C-d>', 5)
harpoonremap('<C-j>', 6)
harpoonremap('<C-f>', 7)
harpoonremap('<C-h>', 8)


