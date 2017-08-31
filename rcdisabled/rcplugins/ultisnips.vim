"
" ultisnips - The ultimate snippet solution for Vim.
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"

if v:version >= 704

  Plug 'SirVer/ultisnips'

  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim

