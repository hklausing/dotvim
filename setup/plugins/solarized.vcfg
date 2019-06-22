"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-colors-solarized - precision colorscheme for the vim text editor
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"
Plug 'altercation/vim-colors-solarized'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"
" Toggle background color between dark and light
nnoremap <A-F7>       :call ToggleBG()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"
function! ToggleBG()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"
" set background color to the default value dark
set background=dark

" set these settings if vim-colors-sloarized is not found
colorscheme mustang         " background is handled by scheme

" use 256 colors
set t_Co=256


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
