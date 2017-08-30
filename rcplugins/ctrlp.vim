"
" Ctrl-P - Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"

  Plug 'ctrlpvim/ctrlp.vim'             "
  Plug 'tacahiroy/ctrlp-funky'          " Simple function navigator for ctrlp.vim


  " Mappings

  " ctrlp.vim Open a selection list of buffers.
  nnoremap <c-b>            :CtrlPBuffer<CR>
  "
  if get(g:, 'loaded_ctrlp_funky', 0)

    " for plugin ctrlp/funky.vim
    nnoremap <LEADER>fu     :CtrlPFunky<CR>

    " narrow the list down with a word under cursor
    nnoremap <LEADER>fU     :execute 'CtrlPFunky ' . expand('<cword>')<CR>

  endif


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim

