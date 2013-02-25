" basic Mappings
nnoremap ; :
nnoremap j gj
nnoremap k gk

" enter in normal mode removes highlight except in quickfix window
nnoremap <CR> :noh<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Ctrl-h/j/k/l for easy window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
