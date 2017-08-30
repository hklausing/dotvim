"
" vim-colors-solarized - precision colorscheme for the vim text editor
"

Plug 'altercation/vim-colors-solarized'

" Toggle background color between dark and light
nnoremap <A-F7>       :call ToggleBG()<CR>

function! ToggleBG()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
