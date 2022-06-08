-- Color theme
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.wrap = true
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme gruvbox]])

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>bg',
  function() 
    if vim.o.background == "dark" then 
      vim.o.background = "light" 
    else vim.o.background = "dark" 
    end 
  end, opts)
