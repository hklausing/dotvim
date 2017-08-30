"
" tagbar - Provides an easy way to browse the tags of the current file.
"


if v:version > 701

  Plug 'majutsushi/tagbar'


  " tagbar
  noremap <F7>      :TagbarToggle<cr>

endif
