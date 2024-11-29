-- Harpoon

vim.keymap.set('n', '<leader>hm', function() require("harpoon.mark").add_file() end, opts)
vim.keymap.set('n', '<leader>hh', function() require("harpoon.ui").toggle_quick_menu() end, opts)

local harpoonremap = function(mapping, num)
  vim.keymap.set('n', mapping, function() require("harpoon.ui").nav_file(num) end, opts)
end

harpoonremap('<C-a>', 1)
harpoonremap('<C-s>', 2)
harpoonremap('<C-d>', 3)
harpoonremap('<C-f>', 4)
harpoonremap('<C-g>', 5)

harpoonremap('<C-h>', 6)
harpoonremap('<C-j>', 7)
harpoonremap('<C-k>', 8)
harpoonremap('<C-l>', 9)
harpoonremap('<C-;>', 10)


