vim.g.mapleader = " "

require("general")
require("mappings")
require("plugins")
require("theme")

vim.cmd([[colorscheme gruvbox]])

require('lualine').setup{
								options = { theme = 'auto' }
						}
