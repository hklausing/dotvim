"
" Ack - Integrate ack (grep replacement) into vim
"

Plug 'mileszs/ack.vim'

nmap     <LEADER>ck   :Ack!<space>
nnoremap <LEADER>cc   :cclose<cr>


function! s:VisualAck()
  let temp = @"
  normal! gvy
  let escaped_pattern = escape(@", "[]().*")
  let @" = temp
  execute "Ack! '" . escaped_pattern . "'"
endfunction


nnoremap K      :Ack! '<C-r><C-w>'<cr>
vnoremap K      :<C-u>call <sid>VisualAck()<cr>


if executable('ack')
  let g:ackprg = 'ack -H --nocolor --nogroup --column'
elseif executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
