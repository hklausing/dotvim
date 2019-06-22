"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Status line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"
"""
" Returns a string with a content that is related to the status
" of paste mode.
function! HasPaste()
  if &paste
    return ' | PASTE MODE'
  endif
  return '             '
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"
" Always show the status line
set laststatus=2

" Format the status line

let g:currentmode = {
      \ 'n'  : 'Normal ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'Visual ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'Insert ',
      \ 'R'  : 'Replace ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \}
" jamessan's
set statusline=   " clear the status line for when vimrc is reloaded
set statusline+=%{g:currentmode[mode()]}     " mode name
set statusline+=%3n:                         " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " file type
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%{HasPaste()}                " show Paste mode
set statusline+=%=                           " right align
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
