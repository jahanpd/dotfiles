-- Line numbering
vim.o.number = true
vim.o.relativenumber = true
-- vim.api.nvim_set_option(0, "wrap", true)

-- Better Markdown
vim.o.conceallevel = 0

-- Mouse
vim.o.mouse = "a"

-- Search case
vim.o.ignorecase = true
vim.o.smartcase = true

-- Syntax highlighting
-- vim.o.syntax = "enable"

-- Minimal number of lines to scroll when the cursor gets off the screen
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Indents
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true



-- vim.cmd("autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab")
-- vim.cmd("filetype indent plugin on")
