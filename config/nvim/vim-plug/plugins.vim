" auto-install vim-plug
if empty(glob('~/.dotfiles/config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.dotfiles/config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.dotfiles/config/nvim/autoload/plugged')
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    " Plug 'romgrk/barbar.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-scripts/dbext.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'folke/zen-mode.nvim'

    " File navigation
    Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'

    " color themes
    Plug 'rafamadriz/neon'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'olimorris/onedarkpro.nvim'
    Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
    Plug 'tanvirtin/monokai.nvim'
    Plug 'gruvbox-community/gruvbox'
call plug#end()

lua require 'colorizer'.setup()
