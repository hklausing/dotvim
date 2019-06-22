"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" ctags - generates an index/tag file of names found in source and header files
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"

nmap <LEADER>ct     :call ReindexCtags()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"

" Index ctags from any project, including those outside Rails
function! ReindexCtags()
  let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'

  if exists(l:ctags_hook)
    exec '!'. l:ctags_hook
  else
    exec "!ctags -R ."
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
