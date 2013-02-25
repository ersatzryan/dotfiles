if exists("g:loaded_sweeter_vest")
  finish
endif

command! -nargs=0 SweeterVestRunTest     call sweeter_vest#RunTest()
command! -nargs=0 SweeterVestRunFile     call sweeter_vest#RunFile()
command! -nargs=0 SweeterVestRunAll      call sweeter_vest#RunAll()
command! -nargs=0 SweeterVestRunLast     call sweeter_vest#RunLast()
command! -nargs=0 SweeterVestRunContext  call sweeter_vest#RunContext()
command! -nargs=0 SweeterVestRunFeatures call sweeter_vest#RunFeatures()
command! -nargs=1 SweeterVestRSpecSeed   call sweeter_vest#RSpecSeed(<args>)

if !exists("g:sweeter_vest_skip_mappings")
  nnoremap <leader>rt :SweeterVestRunTest<cr>
  nnoremap <leader>rf :SweeterVestRunFile<cr>
  nnoremap <leader>ra :SweeterVestRunAll<cr>
  nnoremap <leader>rl :SweeterVestRunLast<cr>
  nnoremap <leader>rc :SweeterVestRunContext<cr>
  nnoremap <leader>rF :SweeterVestRunFeatures<cr>
  nnoremap <leader>rs :SweeterVestRSpecSeed 
endif

let g:loaded_sweeter_vest = 1
