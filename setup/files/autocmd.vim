"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" autocmd - Auto commands
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"
" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"

" Autogenerate tags after writing files.
autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc


autocmd BufWrite *.py         :call DeleteTrailingWS()
autocmd BufWrite *.sh         :call DeleteTrailingWS()
autocmd BufWrite *.pl,*pm     :call DeleteTrailingWS()
autocmd BufWrite *.rb         :call DeleteTrailingWS()


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif


" Define the template names
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
