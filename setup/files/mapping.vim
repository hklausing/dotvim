"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" mapping
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"
" Fast saving for a single file
nmap <LEADER>w      :w!<CR>

" Fast saving for all files
nmap <LEADER>wa     :wa!<CR>

" Close the current buffer
map <LEADER>bd      :bdelete<CR>

" Close all buffers
map <LEADER>ba      :1,1000 bd!<CR>

" New buffer in current window
map <LEADER>bn      :enew<CR>

" List buffers
map <LEADER>bl      :ls<CR>

" Useful mappings for managing tabs
map <LEADER>tn      :tabnew<CR>
map <LEADER>to      :tabonly<CR>
map <LEADER>tc      :tabclose<CR>
map <LEADER>tm      :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <LEADER>te      :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
map <LEADER>cd      :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers
try
  if v:version > 703
    set switchbuf=useopen,usetab,newtab
  else
    set switchbuf=useopen,usetab
  endif
  set showtabline=2
catch
endtry

" Remember info about open buffers on close
set viminfo^=%

" makes changes to files that have read-only permissions for current user/group
cmap w!! %!sudo tee > /dev/null %

" Shortcut for FuzzyFinder
map <LEADER>f       :FufFile<CR>

"
" Buffer
"
map <C-Left>        :bprevious<CR>
map <C-Right>       :bnext<CR>
map <C-End>         :Bclose<CR>

" Close vim with all bufers and tabs
map <LEADER>q       :qall<CR>

" Disable highlight when <LEADER><CR> is pressed
map <silent> <LEADER><CR> :noh<CR>

" Help
noremap  <LEADER>hm   <ESC>:help myvim.txt<CR>

" Copy text to clipboard
noremap <C-C>       "+y

" Copy text from clipboard
noremap <C-V>       "+gP



"       Norm            Shift           Ctrl            Alt
" F1    help            -               x               -
" F2    folding         -               -               -
" F3    V-split         H-split         -               -
" F4    toggle_matches  toggle_case     X               X
" F5    toggle_line_no  toggle_paste    X               SpellCheck
" F6    gundo           -               -               -
" F7    TagbarToggle    toggle_past     X               toggle_bg_color
" F8    -               -               toggleTagBar    toggle_list
" F9    ToggleSyntax    toggle_whitespc -               -
" F10   X               -               -               -
" F11   show_spaces     trim_spaces     -       -
" F12   -               -               -               -
" Note: X = system related key combinations in GUI, cannot be used by gvim

"

" folding
inoremap <F2>         <C-O>za
nnoremap <F2>         za
onoremap <F2>         <C-C>za
vnoremap <F2>         zf

" nnoremap <F3>         :Vexplore<CR>
" nnoremap <s-F3>       :Hexplore<CR>

" toggle highlighted matches
nnoremap <F4>         :set hlsearch! <bar> set hlsearch?<CR>

" toggle case sensitivity for searching
nnoremap <S-F4>       :set ignorecase! <bar> set ignorecase?<CR>

" Toggle paste feature
set pastetoggle=<S-F5>

" Toggle spellcheck
nnoremap <A-F5>       :setlocal spell! spelllang=en_us<CR>

" " Toggles view of unprintable characters
" noremap <A-F8>        :set list! <bar> set list?<CR>

map <F9>              :call ToggleSyntaxHighlighting()<CR>

" Toggle displaying white-space characters.
noremap <s-F9>        :set list!<CR>


" Copy file name to clipboard
" just the file name
nmap <LEADER>fn   :let @*=expand("%")<CR>
" file name with path
nmap <LEADER>fp   :let @*=expand("%:p")<CR>
" copy marked text to clipboard
map <LEADER>c     "+y
" Paste clipboard content to buffer
map <LEADER>v     "+gP



"" Visual mode pressing * or # searches for the current selection
"" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :call VisualSelection('f')<CR>
"vnoremap <silent> # :call VisualSelection('b')<CR>



" Move a line up/down
nnoremap <A-j>    :m .+1<CR>==
nnoremap <A-k>    :m .-2<CR>==
inoremap <A-j>    <Esc>:m .+1<CR>==gi
inoremap <A-k>    <Esc>:m .-2<CR>==gi

" Move selected lines up/down
vnoremap <A-j>    :m '>+1<CR>gv=gv
vnoremap <A-k>    :m '<-2<CR>gv=gv

" Quickly edit the vimrc file in a new tab
nmap <silent> <LEADER>ev    :tabedit $MYVIMRC<CR>

" Quickly source the vimrc file
nmap <silent> <LEADER>sv    :source $MYVIMRC <bar> echon "source done." <bar> sleep 750m<CR>


" Start a bash within vim
nnoremap <LEADER>r          :!bash<CR>

"
" Insert Filename, type the keys very fast!
"
" Insert file name without extension
inoremap \fn <C-R>=expand("%:t:r")<CR>
" Insert file name and keep extension
inoremap \fe <C-R>=expand("%:t")<CR>
" Insert file name with extension and absolute directory
inoremap \ff <C-R>=expand("%:p")<CR>
" Insert absolute path of the directory
inoremap \pa <C-R>=expand("%:p:h")<CR>
" Insert relative path of directory
inoremap \pr <C-R>=expand("%:h")<CR>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"

"""
" toggles the syntax highlighting
"
function! ToggleSyntaxHighlighting()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction



"""
" Don't close window, when deleting a buffer
"
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
