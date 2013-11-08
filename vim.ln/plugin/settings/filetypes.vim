" File types
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby

" JSON use javascript highlighting, but json format = program (gg=G)
au BufNewFile,BufRead *.json set ft=json
au FileType json setlocal equalprg=python\ -m\ json.tool
au FileType json setlocal syntax=javascript
