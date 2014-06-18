" Show hidden files
let g:ctrlp_show_hidden = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*

" Files and directories to ignore
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v\/(\.git|\.bundle|vendor\/bundle|tmp|public\/system|coverage)$',
      \ 'file': '\v(.gitkeep|.gitignore|.jpg|.jpeg|.gif.|.png|.ico|bin/[^.]+)$'
      \ }

" Use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
