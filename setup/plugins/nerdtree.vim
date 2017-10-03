"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" nerdtree - The NERD tree allows you to explore your file system
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"
if v:version > 703

  Plug 'scrooloose/nerdtree'          "
  Plug 'Xuyuanp/nerdtree-git-plugin'  "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"
  " Mappings for NERTDTree
  map <C-N>   :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"
if(1==0)
  "let g:NERDTreeDirArrowExpandable = '>'
  "let g:NERDTreeDirArrowCollapsible = 'v'

  let g:NERDTreeDirArrowExpandable = '→'
  let g:NERDTreeDirArrowCollapsible = '↓'

  "let g:NERDTreeIndicatorMapCustom = {
  "    \ 'Modified'  : 'm',
  "    \ 'Staged'    : 's',
  "    \ 'Untracked' : 'u',
  "    \ 'Renamed'   : 'r',
  "    \ 'Unmerged'  : 'u',
  "    \ 'Deleted'   : 'd',
  "    \ 'Dirty'     : 'D',
  "    \ 'Clean'     : 'c',
  "    \ 'Ignored'   : 'i',
  "    \ 'Unknown'   : 'U'
  "    \ }

  "let g:NERDTreeIndicatorMapCustom = {
  "  \ 'Modified'  : nr2char(8201),
  "  \ 'Ignored'   : nr2char(8239),
  "  \ 'Renamed'   : nr2char(8199),
  "  \ 'Unmerged'  : nr2char(8200),
  "  \ 'Deleted'   : nr2char(8287),
  "  \ 'Unknown'   : nr2char(8195),
  "  \ 'Dirty'     : nr2char(8202),
  "  \ 'Staged'    : nr2char(8192),
  "  \ 'Untracked' : nr2char(8194),
  "  \ 'Clean' : nr2char(8196)
  "  \ }
  endif


endif

" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
