"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-licenses - Provides Commands to Add Licenses at the Top of the Buffer 
"
" Add license to the top of the document with: :Gpl
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"
Plug 'antoyo/vim-licenses'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"
command! License call InsertLicense('licenseFile')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"
let g:licenses_copyright_holders_name = 'Klausing, H. <h.klausing@gmx.de>'
let g:licenses_authors_name = 'Klausing, H. <h.klausing@gmx.de>'
let g:licenses_default_commands = ['gpl', 'mit']


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
