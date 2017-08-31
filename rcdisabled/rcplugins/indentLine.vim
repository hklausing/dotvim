"
" indentLine - A vim plugin to display the indention levels with thin vertical lines
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"

Plug 'Yggdroot/indentLine'

if !has("gui_running")
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = 'â”†'
  let g:indentLine_faster = 1
endif

" " Vim
" let g:indentLine_color_term = 239

" " GVim
" let g:indentLine_color_gui = '#A4E57E'

" " none X terminal
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)

" " Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim

