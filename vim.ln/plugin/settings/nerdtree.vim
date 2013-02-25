autocmd vimenter * if !argc() | NERDTree | endif    " If vim starts with no file open NERDTree

let NERDTreeHijackNetrw = 0
let NERDTreeMouseMode=2
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.class$', '\.o', '\~$']
