source ~/.dotfiles/config/nvim/settings.vim
source ~/.dotfiles/config/nvim/keys/mappings.vim
source ~/.dotfiles/config/nvim/vim-plug/plugins.vim
source ~/.dotfiles/config/nvim/lua.vim
source ~/.dotfiles/config/nvim/LuaFunctions.vim

set background=dark
colorscheme gruvbox

" tree-sitter based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" set sensible highlight matches that don't obscure the text
:highlight MatchParen cterm=underline ctermbg=black ctermfg=NONE
:highlight MatchParen gui=underline guibg=black guifg=NONE 



