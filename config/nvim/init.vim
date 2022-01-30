source ~/.dotfiles/config/nvim/settings.vim
source ~/.dotfiles/config/nvim/keys/mappings.vim
source ~/.dotfiles/config/nvim/vim-plug/plugins.vim
source ~/.dotfiles/config/nvim/lua.vim

" load theme, synced with alacritty
if !empty(glob("~/.vimrc_background"))
    source ~/.vimrc_background
endif


" create toggle for background tranparency
let guibg=synIDattr(hlID("Normal"),"bg")

" this line make background transparent

nmap <C-b><C-s> :colorscheme base16-3024 <CR> :source ~/.vimrc_background <CR>
nmap <C-b><C-t> :hi Normal guibg=NONE ctermbg=NONE <CR>

hi Normal guibg=NONE ctermbg=NONE

" tree-sitter based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" set sensible highlight matches that don't obscure the text
:highlight MatchParen cterm=underline ctermbg=black ctermfg=NONE
:highlight MatchParen gui=underline guibg=black guifg=NONE 
