"
"
"

" session default font values
let s:defaultfontsize = 11
let s:minfontsize = 5
let s:maxfontsize = 48

" related functions

"""
" Font size scaling
"
function! EnlargeFont()
  let l:font = split( &guifont )
  if l:font[-1] < s:maxfontsize
    let l:font[-1] = l:font[-1] + 1
    let &guifont = join( l:font, ' ' )
  endif
endfunction

function! ShrinkFont()
  let l:font = split( &guifont )
  if l:font[-1] > s:minfontsize
    let l:font[-1] = l:font[-1] - 1
    let &guifont = join( l:font, ' ' )
  endif
endfunction

function! SetDefaultFontSize()
  let l:font = split( &guifont )
  let l:font[-1] = s:defaultfontsize
  let &guifont = join( l:font, ' ' )
endfunction


" Set extra options when running in GUI mode
if has("gui_running")
  " Set gvim window size
  set lines=50 columns=128
  "
  set guioptions-=T           " no toolbar
  set guioptions-=e           " disable GUI-tabs

  if has("gui_gtk2") || has("gui_gtk3")
    "echo "GUI-Type: gui_gtk2 or gui_gtk3"
    let font = {"name" : "Hack", "size" : "11" }
    call system("fc-list -q " . font.name)
    if has("unix") && !v:shell_error
      let &guifont = join(values(font))
    else
      let font = {"name" : "DejaVu Sans Mono", "size" : s:defaultfontsize }
      let &guifont = join(values(font))
    endif
  elseif has("gui_photon")
    "echo "GUI-Type: gui_photon"
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    "echo "GUI-Type: gui_kde"
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    "echo "GUI-Type: x11"
    "set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    "set guifont=Courier\ New
  else
    echo "GUI-Type: ???"
    "set guifont=Courier_New:h11:cDEFAULT
  endif

endif

" Font size change
" ... increase font size <Ctrl><+>
inoremap <C-kPlus>    <ESC>:call EnlargeFont()<CR>i
nnoremap <C-kPlus>    :call EnlargeFont()<CR>

" ... decrease font size <Ctrl><->
inoremap <C-kMinus>   <ESC>:call ShrinkFont()<CR>i
nnoremap <C-kMinus>   :call ShrinkFont()<CR>

" ... set font size to default value <Ctrl><0>
inoremap <C-k0>       <ESC>:call SetDefaultFontSize()<CR>i
nnoremap <C-k0>       :call SetDefaultFontSize()<CR>


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
