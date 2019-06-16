"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" ansible-vim - A vim plugin for syntax highlighting Ansible's common filetypes
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"
if v:version > 703

  Plug 'pearofducks/ansible-vim'           "

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"
"au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
