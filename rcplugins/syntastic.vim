"
" syntastic - syntax checking
"


Plug 'vim-syntastic/syntastic'        " syntax checking


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim