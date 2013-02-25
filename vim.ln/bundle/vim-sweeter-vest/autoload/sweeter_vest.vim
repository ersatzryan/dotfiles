" ,rf
"
function! s:SweeterVestRunFile()
  let s:current_file = @%
  unlet s:current_line
  call s:SweeterVestSelectRunner()
endfunction

" ,rt
"
function! s:SweeterVestRunTest()
  let s:current_file = @%
  let s:current_line = line(".")
  call s:SweeterVestSelectRunner()
endfunction

" ,rl
"
function! s:SweeterVestRunLast()
  if exists("s:last_command")
    call s:SweeterVestRun(s:last_command)

    unlet s:rspec_seed
  endif
endfunction

" ,ra
"
function! s:SweeterVestRunAll()
  unlet s:current_file

  if !empty(findfile("Rakefile"))
    call s:SweeterVestRun("rake")
  else
    call s:SweeterVestSpecRunner()
  endif
endfunction

" ,rc
"
function! s:SweeterVestRunContext()
  let s:current_file = @%
  let s:current_line = search("describe\\|context\\|\\cscenario", "bcn")
  call s:SweeterVestSelectRunner()
endfunction

" ,rF
"
function! s:SweeterVestRunFeatures()
  if isdirectory("features")
    call s:SweeterVestRun("cucumber features")
  endif

  if isdirectory("spec/features")
    call s:SweeterVestRun("rspec spec/features")
  endif

  if isdirectory("spec/acceptance")
    call s:SweeterVestRun("rspec spec/acceptance")
  end
endfunction

function! s:SweeterVestSelectRunner()
  if !empty(matchstr(expand("%"), "^spec/"))
    call s:SweeterVestSpecRunner()
  elseif !empty(matchstr(expand("%"), "^features/"))
    call s:SweeterVestCukeRunner()
  elseif !empty(matchstr(expand("%"), "^test/"))
    call s:SweeterVestTestRunner()
  endif
endfunction

function! s:SweeterVestRun(command)
  let s:last_command = a:command

  silent exec ":!clear"
  silent exec ":!echo time: " . a:command
  exec ":!time " . a:command
endfunction


"----------------------------------------------------------
" RSpec
"
function! s:SweeterVestSpecRunner()
  if exists("s:rspec_seed")
    let options = "--order rand:" . s:rspec_seed . " "
  else
    let options = "--order rand "
  endif

  if exists("s:current_file")
    let which = s:current_file

    if exists("s:current_line")
      let which .= ":" . s:current_line
    endif
  else
    let which = "spec"
  endif

  call s:SweeterVestRun("rspec " . options . which)

  unlet s:rspec_seed
endfunction

function! s:SweeterVestRSpecSeed(seed)
  let s:rspec_seed = a:seed
endfunction

"----------------------------------------------------------
" Cucumber
"
function! s:SweeterVestCukeRunner()
  if exists("s:current_file")
    let which = s:current_file

    if exists("s:current_line")
      let which .= ":" . s:current_line
    endif
  else
    let which = ""
  endif

  call s:SweeterVestRun("cucumber " . which)
endfunction

"----------------------------------------------------------
" Test::Unit
"
function! s:SweeterVestTestRunner()
  if exists("s:current_file")
    let which = s:current_file

    if exists("s:current_line")
      let which .=  " -n " . matchstr(getline(search("test_*", "bc")), "test_\\S\\+")
    endif
  else
    let which = ""
  endif

  call s:SweeterVestRun("ruby -Ilib:test " . which)
endfunction

"----------------------------------------------------------
" Public
"
function! sweeter_vest#RunTest()
  call s:SweeterVestRunTest()
endfunction

function! sweeter_vest#RunFile()
  call s:SweeterVestRunFile()
endfunction

function! sweeter_vest#RunAll()
  call s:SweeterVestRunAll()
endfunction

function! sweeter_vest#RunLast()
  call s:SweeterVestRunLast()
endfunction

function! sweeter_vest#RunContext()
  call s:SweeterVestRunContext()
endfunction

function! sweeter_vest#RunFeatures()
  call s:SweeterVestRunFeatures()
endfunction

function! sweeter_vest#RSpecSeed(seed)
  call s:SweeterVestRSpecSeed(a:seed)
endfunction
