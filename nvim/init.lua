-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- function for loading env keys
local function load_key(path, var)
  local f = io.open(vim.fn.expand(path), "r")
  if not f then return nil end
  local key = f:read("*l")
  f:close()
  key = key and key:gsub("%s+$", "")
  if key and key ~= "" then
    vim.env[var] = key
    return key
  end
end

-- loading keys
load_key("~/Sync/keys/openrouter", "OPENROUTER_API_KEY")


require("general")
require("mappings")
require("theme")

require("configs.lazy")

vim.o.background="dark"

require('lualine').setup{
								options = { theme = 'auto' }
						}

require('configs.lsp')
vim.cmd([[colorscheme catppuccin]])

local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
vim.o.signcolumn = 'yes'
