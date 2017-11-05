"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-colors-solarized - precision colorscheme for the vim text editor
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Publish plugins
"
Plug 'altercation/vim-colors-solarized'
source ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"
" Toggle background color between dark and light
call togglebg#map("<A-S-F7>")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"

" use 256 colors
set t_Co=256

let g:solarized_termcolors=256  " terminal colors
let g:solarized_termtrans=0     " terminal transparent background

"
syntax enable

" set background color to the default value dark
set background=dark

" set these settings if vim-colors-sloarized is not found
set rtp+=~/.vim/bundle/vim-colors-solarized
colorscheme solarized       " background is handled by scheme


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
