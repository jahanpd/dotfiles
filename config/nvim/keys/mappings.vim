"set leader key
let mapleader = ","

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
" nnoremap <TAB> :bnext<CR>
nnoremap <TAB> <C-^>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
nnoremap <C-Q><C-W><C-Q> :q!<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" map F11 for spellcheck toggle
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" remaps for folding
nnoremap <Leader>z :set nofoldenable <CR>

" remap for surround in brackets etc
nnoremap <Leader>( bcw()<Esc>P
nnoremap <Leader>" bcw""<Esc>P
nnoremap <Leader>' bcw''<Esc>P

" Telescope remaps
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Harpoon remaps
nnoremap <leader>hm :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <C-a> :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <C-d> :lua require("harpoon.ui").nav_file(5)<cr>
