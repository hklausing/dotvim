"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" tagbar - Provides an easy way to browse the tags of the current file.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"

if v:version > 701

  Plug 'majutsushi/tagbar'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"
  " tagbar
  noremap <F7>      :TagbarToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"


endif

" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
