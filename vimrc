"
" Vimrc
"
" This file contains the minimal settings to set the foundation, with the
" majority of the configuration and settings living in files spread between
" vim/rcfiles and vim/rcplugins
"
" Prepare vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" https://github.com/christoomey/dotfiles


" Source all files in a indicated directory with extension .vim
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      echo "execute 'source'" . config_file
      execute 'source' config_file
    endif
  endfor
endfunction



set nocompatible

" Need to set the leader before defining any leader mappings
let mapleader = ","

" insert vim plugins with additional setting
call plug#begin('~/.vim/bundle')
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

" insert vim settings
call s:SourceConfigFilesIn('rcfiles')





"execute 'source ~/.vim/mainrc.vim'




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Maintainer:
""        Heiko Klausing
""       http://www.hmkf.ed - [h.klausing@gmx.de]
""
""           Based on Amir Salihefendic, http://amix.dk/vim/vimrc.html
""
"" Version:
""       1.2.1 - 2017-04-17
""
"" Blog_post:
""       -
""
"" Awesome_version:
""       Get this config, nice color schemes and lots of plugins!
""
""       Install the awesome version from:
""
""           https://github.com/amix/vimrc
""
"" Syntax_highlighted:
""       http://amix.dk/vim/vimrc.html
""
"" Raw_version:
""       http://amix.dk/vim/vimrc.txt
""
"" Sections:
""    -> General
""    -> Plugin Manager
""    -> VIM user interface
""    -> Colors and Fonts
""    -> Files and backups and undo
""    -> Text, tab and indent related
""    -> Visual mode related
""    -> Moving around, tabs, windows and buffers
""    -> Status line
""    -> Editing mappings
""    -> Function key mappings
""    -> Template handling
""    -> Spell checking
""    -> Plugin Settings
""    -> Misc
""    -> Helper functions
""
"" Notes:
""   zM - close all open markers
""   zR - open all closed markers
""   zo - opens a fold at cursor
""   zc - closes a fold at cursor
""   :mkview - stores folds
""
"" Bash:
""   If the bash is started from gvim no colors are displayed.
""   The color codes of the PS1 variable diaplayed as their
""   codes, which makes the prompt unreadable. This can be
""   solved by adding the following code to the .bashrc file:
""     --------------------------------
""     # bash start from gvim
""     if [ "$TERM" = "dumb" ]; then
""         PS1='\u@\h (\W) \$ '
""     fi
""     --------------------------------
""
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""






"
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => General {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Sets how many lines of history VIM has to remember
"set history=700
"
"" Set to auto read when a file is changed from the outside
"set autoread
"
"" With a map leader it's possible to do extra key combinations
"" like <LEADER>w saves the current file
"let   mapleader = ","
"let g:mapleader = ","
"
"" Fast saving for a single file
"nmap <LEADER>w      :w!<CR>
"
"" Fast saving for all files
"nmap <LEADER>wa     :wa!<CR>
"
"" Set 'nocompatible' to ward off unexpected things that your distro might
"" have made, as well as sanely reset options when re-sourcing .vimrc
"set nocompatible              " Use the full vim feature set
"
"" Use 256 colors
"set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Plugin Manager {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" check if Vundle is available before it can be used.
"if !empty(glob("~/.vim/bundle/Vundle.vim/autoload/vundle.vim"))
"
"  filetype off                  " This is required for vundle
"
"  "-----
"  " Install plugins   :PluginInstall
"  " Show help         :h vundle
"  "-----
"
"  " Set up the runtime path
"  set rtp+=~/.vim/bundle/Vundle.vim
"
"  " Initialize vundle
"  call vundle#begin()
"
"  " This should always be the first
"  Plugin 'gmarik/Vundle.vim'              " Let Vundle manage Vundle, required
"  "
"  " Customized plugin list:
"  if v:version > 703
"    Plugin 'scrooloose/nerdtree'          " The NERD tree allows you to explore your file system
"    Plugin 'Xuyuanp/nerdtree-git-plugin'  "
"  endif
"  Plugin 'altercation/vim-colors-solarized'
"  Plugin 'ctrlpvim/ctrlp.vim'             " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"  Plugin 'tacahiroy/ctrlp-funky'          " Simple function navigator for ctrlp.vim
"  Plugin 'vim-airline/vim-airline'        "+- status/tabline for vim that's light as air
"  Plugin 'vim-airline/vim-airline-themes' "+
"  if v:version > 703
"    Plugin 'ntpeters/vim-better-whitespace' " StripWhitespace, :ToggleWhitespace
"  endif
"
"  Plugin 'xolox/vim-misc'                 " used for vim-session
"  Plugin 'xolox/vim-session'              " Extended session management for vim to store/restore working sessions
"  Plugin 'tomtom/tcomment_vim'            " tcomment provides easy to use, file-type sensible comments for
"  Plugin 'tpope/vim-surround'             " 'surroundings': parentheses, brackets, quotes, XML tags, and more
"  Plugin 'sjl/gundo.vim'                  " Graph your Vim undo tree in style. <F6>
"  Plugin 'geoffharcourt/vim-matchit'      " select <tag> and press %
"  Plugin 'mileszs/ack.vim'                " Run your favorite search tool from Vim
"  Plugin 'godlygeek/tabular'              " Vim script for text filtering and alignment; e.g. ':Tab /='
"  Plugin 'junegunn/vim-easy-align'        " EasyAlign
" "Plugin 'ervandew/supertab'              " Auto completion
"  Plugin 'yegappan/grep'                  " Integrates the grep, fgrep, egrep, and agrep tools
"  Plugin 'nathanaelkane/vim-indent-guides' " Indent Guides is a plugin for visually displaying indent levels in Vim.
"  Plugin 'robcsi/viewmaps.vim'
"  Plugin 'vim-syntastic/syntastic'        " syntax checking
"  "Plugin 'hotchpotch/perldoc-vim'
"  "Plugin 'perl-support.vim'
"  "Plugin 'vim-ruby/vim-ruby'
"  "Plugin 'rhysd/github-complete.vim'      " Vim input completion for GitHub
"  Plugin 'vim-scripts/SearchComplete'     " Tab completion of words inside of a search ('/')
"                                          " wget -O mthesaur.txt https://raw.githubusercontent.com/zeke/moby/master/words.txt
"  Plugin 'vim-utils/vim-man'              " View man pages in vim. Grep for the man pages.
"  Plugin 'pseewald/vim-anyfold'           " Vim plugin for indent based folding and motion for any filetypes.
"  Plugin 'ron89/thesaurus_query.vim'      " To lookup synonyms of any word under cursor
"
"  if v:version > 701
"    "Plugin 'bling/vim-airline'            " status/tabline for vim without Python.
"    "Plugin 'vim-scripts/AutoComplPop'     " Automatically opens popup menu for completions
"    Plugin 'Shougo/neocomplcache.vim'     " Ultimate auto completion system for Vim
"    Plugin 'majutsushi/tagbar'            " Provides an easy way to browse the tags of the current file.
"  endif
"
"  if v:version > 703
"    Plugin 'L9'                           " Required for vim-fugitive
"    Plugin 'tpope/vim-fugitive'           " a Git wrapper
"    Plugin 'jlanzarotta/bufexplorer'      " Can quickly and easily switch between buffers
"  endif
"
"  if v:version > 704
"    Plugin 'lifepillar/vim-mucomplete'    " Autocomplition
"  endif
"
"  if has("python")
"    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}    " Sparkup lets you write HTML code faster
"  endif
"
"  " End of plugin definitions for vundle
"  call vundle#end()                       " required
"
"  " Enable filetype plugins
"  filetype plugin indent on
"
"endif   " if !empty(glob("~/.vim/bundle/Vundle.vim/autoload/vundle.vim"))
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Setup plugin options; this function is called before the editor
"" is usable.
"function! SetupPluginOptions()
"
"  """""""""""""""""""""""""
"  if exists("g:loaded_nerd_tree")
"    " Mappings for NERTDTree
"    map <C-N>   :NERDTreeToggle<CR>
"  endif
"
"  """""""""""""""""""""""""
"  if !empty(glob("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"    " Setup for vim-colors-solarized
"    "
"    " use this command before the first use of colorschem solarized
"    if !has('gui_running')
"      let g:solarized_termcolors = 256
"    endif
"    "
"    syntax enable
"    set background=dark
"    "set background=light
"    colorscheme solarized
"    " required to activate ToggleBG
"    call togglebg#map("")
"    "
"  endif
"
"  """""""""""""""""""""""""
"  if exists('g:loaded_ctrlp')
"    " ctrlp.vim Open a selection list of buffers.
"    nnoremap <c-b>    :CtrlPBuffer<CR>
"    "
"    if get(g:, 'loaded_ctrlp_funky', 0)
"      " for plugin ctrlp/funky.vim
"      nnoremap <LEADER>fu     :CtrlPFunky<CR>
"      " narrow the list down with a word under cursor
"      nnoremap <LEADER>fU     :execute 'CtrlPFunky ' . expand('<cword>')<CR>
"    endif
"  endif
"
"  """""""""""""""""""""""""
"  " Format the status line
"" if exists("g:loaded_airline")
"      echo 1234
"    " Airline loaded
"    call SetupAirline()
"
"" endif
"
"  """""""""""""""""""""""""
"  if exists("g:loaded_easy_align_plugin")
"    " Setting for EasyAlign
"    " Start interactive EasyAlign in visual mode (e.g. vipga)
"    xmap ga            <Plug>(EasyAlign)
"    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
"    nmap ga            <Plug>(EasyAlign)
"    "
"  endif
"
"  """""""""""""""""""""""""
"  if exists("g:loaded_viewmaps")
"    " Setting for Viewmaps
"    "display normal mode maps
"    nnoremap <silent> <LEADER>dn :ViewMaps n quickfix<CR>
"    "display insert mode maps
"    nnoremap <silent> <LEADER>di :ViewMaps i quickfix<CR>
"    "display visual mode maps
"    nnoremap <silent> <LEADER>dv :ViewMaps v quickfix<CR>
"    "display select mode maps
"    nnoremap <silent> <LEADER>ds :ViewMaps s quickfix<CR>
"    "display operator mode maps
"    nnoremap <silent> <LEADER>do :ViewMaps o quickfix<CR>
"    "display command mode maps
"    nnoremap <silent> <LEADER>dc :ViewMaps c quickfix<CR>
"  endif
"
"  """""""""""""""""""""""""
"  if exists("g:loaded_ack")
"    " Setting for Ack
"    if executable('ack')
"      let g:ackprg = 'ack -H --nocolor --nogroup --column'
"    elseif executable('ag')
"      let g:ackprg = 'ag --vimgrep'
"    endif
"    "
"  endif
"
"  """""""""""""""""""""""""
"  if exists('g:loaded_syntastic_plugin')
"    " Syntastic
"    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
"    set statusline+=%*
"    let g:syntastic_always_populate_loc_list = 1
"    let g:syntastic_auto_loc_list            = 1
"    let g:syntastic_check_on_open            = 1
"    let g:syntastic_check_on_wq              = 0
"  endif
"
"  """""""""""""""""""""""""
"  if exists('g:loaded_tagbar')
"    " tagbar
"    noremap <F7>      :TagbarToggle<cr>
"  endif
"
"  """""""""""""""""""""""""
"  if exists("g:loaded_indent_guides")
"    "
"    " Plugin: nathanaelkane/vim-indent-guides
"    let g:indent_guides_start_line = 2
"    let g:indent_guides_guide_size = 1
"    "
"  endif
"
"  """""""""""""""""""""""""
"  if !empty(glob("~/.vim/bundle/vim-session/plugin/session.vim"))
"    " Avoid question about save of current session status.
"    " for xolox/vim-session
"    :let g:session_autoload = 'no'
"  endif
"
"  """""""""""""""""""""""""
"  if exists("g:loaded_thesaurus_query")
"    "
"    " Plugin: reedes/vim-lexical
"   "nnoremap <LEADER>cs :ThesaurusQueryReplaceCurrentWord<CR>
"    "
"  else
"    message "not found!"
"  endif
"
"  """""""""""""""""""""""""
"  if exists("g:loaded_mucomplete")
"    "
"    " Plugin: lifepillar/vim-mucomplete
"   "set completeopt+=menuone
"   "" for autocompletion
"   "inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
"   "inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
"   "inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
"   "" select one of the next two lines
"   "set completeopt+=noselect
"   "set completeopt+=noinsert
"   ""
"   "set shortmess+=c   " Shut off completion messages
"   "set belloff+=ctrlg " If Vim beeps during completion
"   ""
"   "let g:mucomplete#enable_auto_at_startup = 1
"
"   "set noshowmode shortmess+=c
"   "set completeopt-=preview
"   "set completeopt+=longest,menuone,noinsert,noselect
"   "let g:jedi#popup_on_dot = 0  " It may be 1 as well
"   "let g:mucomplete#enable_auto_at_startup = 1
"
"   "set showmode shortmess-=c
"   "set completeopt+=menuone,noinsert,noselect
"   "let g:mucomplete#user_mappings = { 'sqla' : "\<c-c>a" }
"   "let g:mucomplete#chains = { 'sql' : ['file', 'sqla', 'keyn'] }
"   "let g:mucomplete#enable_auto_at_startup = 1
"
"   "" Autocompletion
"    set completeopt=menuone,noinsert,noselect
"    set shortmess+=c " Turn off completion messages
"    inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
"    inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
"    inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
"    let g:mucomplete#enable_auto_at_startup = 1
"
"    "
"  endif
"
"""  syntax enable
"
"
"endfunction   " SetupPluginOptions()
"
"
"" """""""""""""""""""""""""
"" if exists("g:loaded_mucomplete")
""   "
""   " Plugin: lifepillar/vim-mucomplete
""   echo "704"
""  "set completeopt+=menuone
""  "" for autocompletion
""  "inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
""  "inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
""  "inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
""  "" select one of the next two lines
""  "set completeopt+=noselect
""  "set completeopt+=noinsert
""  ""
""  "set shortmess+=c   " Shut off completion messages
""  "set belloff+=ctrlg " If Vim beeps during completion
""  ""
""  "let g:mucomplete#enable_auto_at_startup = 1
"
""  "set noshowmode shortmess+=c
""  "set completeopt-=preview
""  "set completeopt+=longest,menuone,noinsert,noselect
""  "let g:jedi#popup_on_dot = 0  " It may be 1 as well
""  "let g:mucomplete#enable_auto_at_startup = 1
"
""  "set showmode shortmess-=c
""  "set completeopt+=menuone,noinsert,noselect
""  "let g:mucomplete#user_mappings = { 'sqla' : "\<c-c>a" }
""  "let g:mucomplete#chains = { 'sql' : ['file', 'sqla', 'keyn'] }
""  "let g:mucomplete#enable_auto_at_startup = 1
""   "
"" endif
"
"
"
"
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => VIM user interface {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"" Set 7 lines to the cursor - when moving vertically using j/k
"set so=5
"
"" Search down into subfolders. Provides tab-completion for all
"" file-related tasks.
"set path+=**
"
"" Turn on the Wild menu
"set wildmenu
"
"" Ignore compiled, binary files or unwanted directories
"set wildignore=*.o,*.O,*~,*.pyc
"set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
"set wildignore+=.git,.svn
"set wildignore+=*~,*.swp,*.tmp
"
"" Always show current position
"set ruler
"
"" Height of the command bar
"set cmdheight=2
"
"" A buffer becomes hidden when it is abandoned
"set hidden
"
"" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l
"
"" Ignore case when searching
"set ignorecase
"
"" When searching try to be smart about cases
"set smartcase
"
"" Highlight search results
"set hlsearch
"
"" Makes search act like search in modern browsers
"set incsearch
"
"" Don't redraw while executing macros (good performance config)
"set lazyredraw
"
"" For regular expressions turn magic on
"set magic
"
"" Show matching brackets when text indicator is over them
"set showmatch
"
"" How many tenths of a second to blink when matching brackets
"set matchtime=2
"
"" No annoying sound on errors
"set noerrorbells
"set novisualbell
"set t_vb=
"set timeoutlen=1000         " timeout after <LEADER>
"
"" Enable mouse usage (all modes: tabs selection, text selection, text scrolling)
"if has("mouse")
"  set mouse=a
"  set ttymouse=xterm2
"endif
"
"" new
"" share windows clipboard
"set clipboard+=unnamed
"
"" Show line numbers at startup with absolute numbers; Toggel of this
"" feature is assigned to F5.
"autocmd BufReadPost * call NumberToggle("rel-number")
"
""" Auto fold settings
""set foldmethod=marker
"
"" Disable highlight when <LEADER><CR> is pressed
"map <silent> <LEADER><CR> :noh<CR>
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Colors and Fonts {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Enable syntax highlighting
"syntax enable
"
""" use 256 colors
""set t_Co=256
"
"" color handling if altercation/vim-colors-solarized is loaded
"if !empty(glob("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"
"  if has("gui_running")
"    let g:solarized_termcolors = 256
"    let g:solarized_termtrans  = 1
"    let g:solarized_degrade    = 1
"    let g:solarized_bold       = 0
"    let g:solarized_underline  = 0
"    let g:solarized_italic     = 0
"    let g:solarized_contrast   = "normal"
"    let g:solarized_visibility = "high"
"    let g:solarized_hitrail    = 1
"    let g:solarized_menu       = 0
"  else
"    let g:solarized_termcolors = 256
"    let g:solarized_termtrans  = 1
"    let g:solarized_degrade    = 1
"    let g:solarized_bold       = 0
"    let g:solarized_underline  = 0
"    let g:solarized_italic     = 0
"    let g:solarized_contrast   = "normal"
"    let g:solarized_visibility = "high"
"    let g:solarized_hitrail    = 1
"    let g:solarized_menu       = 0
"  end
"
"else
"
"" " use 256 colors
"" set t_Co=256
"
"  " set background color to the default value dark
"  set background=dark
"
"  " set these settings if vim-colors-sloarized is not found
"  colorscheme mustang         " background is handled by scheme
"
"endif
"
"" session default font values
"let s:defaultfontsize = 11
"let s:minfontsize = 5
"let s:maxfontsize = 48
"
"" related functions
"
""""
"" Font size scaling
""
"function! EnlargeFont()
"  let l:font = split( &guifont )
"  if l:font[-1] < s:maxfontsize
"    let l:font[-1] = l:font[-1] + 1
"    let &guifont = join( l:font, ' ' )
"  endif
"endfunction
"
"function! ShrinkFont()
"  let l:font = split( &guifont )
"  if l:font[-1] > s:minfontsize
"    let l:font[-1] = l:font[-1] - 1
"    let &guifont = join( l:font, ' ' )
"  endif
"endfunction
"
"function! SetDefaultFontSize()
"  let l:font = split( &guifont )
"  let l:font[-1] = s:defaultfontsize
"  let &guifont = join( l:font, ' ' )
"endfunction
"
"
"" Set extra options when running in GUI mode
"if has("gui_running")
"  " Set gvim window size
"  set lines=50 columns=128
"  "
"  set guioptions-=T           " no toolbar
"  set guioptions-=e           " disable GUI-tabs
"
"  if has("gui_gtk2") || has("gui_gtk3")
"    "echo "GUI-Type: gui_gtk2 or gui_gtk3"
"    let font = {"name" : "Hack", "size" : "11" }
"    call system("fc-list -q " . font.name)
"    if has("unix") && !v:shell_error
"      let &guifont = join(values(font))
"    else
"      let font = {"name" : "DejaVu Sans Mono", "size" : s:defaultfontsize }
"      let &guifont = join(values(font))
"    endif
"  elseif has("gui_photon")
"    "echo "GUI-Type: gui_photon"
"    set guifont=Courier\ New:s11
"  elseif has("gui_kde")
"    "echo "GUI-Type: gui_kde"
"    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
"  elseif has("x11")
"    "echo "GUI-Type: x11"
"    "set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
"    "set guifont=Courier\ New
"  else
"    echo "GUI-Type: ???"
"    "set guifont=Courier_New:h11:cDEFAULT
"  endif
"
"endif
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Files, backups and undo {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"" Set utf8 as standard encoding and en_US as the standard language
"set encoding=utf8
"
"" Use Unix as the standard file type
"set fileformats=unix,dos,mac
"
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowritebackup
"set noswapfile
"
""" Remove all folds on loaded file
""autocmd BufWinEnter * set foldmethod=manual | normal zE
"
"" Copy file name to clipboard
"" just the file name
"nmap <LEADER>fn   :let @*=expand("%")<CR>
"" file name with path
"nmap <LEADER>fp   :let @*=expand("%:p")<CR>
"
"" Backup current session
"let g:session_autosave = 'no'
"
"" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Text, tab and indent related {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use spaces instead of tabs
"set expandtab
"
"" Be smart when using tabs ;)
"set smarttab
"
"" 1 tab == 4 spaces
"set shiftwidth=4
"set tabstop=4
"
"" Linebreak on 500 characters
"set linebreak       " split lines on white-spaces only
"set textwidth=500   " 0 => not auto-insert line braks, but keep line wrapping
"
"set autoindent      " Auto indent
"set smartindent     " Smart indent
"set wrap            " Wrap lines
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Visual mode related {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"":" Visual mode pressing * or # searches for the current selection
"":" Super useful! From an idea by Michael Naumann
"":vnoremap <silent> * :call VisualSelection('f')<CR>
"":vnoremap <silent> # :call VisualSelection('b')<CR>
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Moving around, tabs, windows and buffers {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Treat long lines as break lines (useful when moving around in them)
""map j           gj
""map k           gk
""
""" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
""map <space>     /
""map <c-space>   ?
"
"" Close the current buffer
"map <LEADER>bd  :bdelete<CR>
"
"" Close all buffers
"map <LEADER>ba  :1,1000 bd!<CR>
"
"" Useful mappings for managing tabs
"map <LEADER>tn  :tabnew<CR>
"map <LEADER>to  :tabonly<CR>
"map <LEADER>tc  :tabclose<CR>
"map <LEADER>tm  :tabmove
"
"" Opens a new tab with the current buffer's path
"" Super useful when editing files in the same directory
"map <LEADER>te    :tabedit <c-r>=expand("%:p:h")<CR>/
"
"" Switch CWD to the directory of the open buffer
"map <LEADER>cd    :cd %:p:h<CR>:pwd<CR>
"
"" Specify the behavior when switching between buffers
"try
"  if v:version > 703
"    set switchbuf=useopen,usetab,newtab
"  else
"    set switchbuf=useopen,usetab
"  endif
"  set showtabline=2
"catch
"endtry
"
"" Remember info about open buffers on close
"set viminfo^=%
"
"" makes changes to files that have read-only permissions for current user/group
"cmap w!! %!sudo tee > /dev/null %
"
"" Shortcut for FuzzyFinder
"map <LEADER>f     :FufFile<CR>
"
""
"" Buffer
""
"map <C-Left>      :bprevious<CR>
"map <C-Right>     :bnext<CR>
"map <C-End>       :Bclose<CR>
"
"" Close vim with all bufers and tabs
"map <LEADER>q     :qall<CR>
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Status line {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Always show the status line
"set laststatus=2
"
"" Format the status line
"if exists("g:loaded_airline")
"  " Airline loaded
"  call SetupAirline()
"
"else
"  " Airline not loaded
"
"  let g:currentmode = {
"        \ 'n'  : 'Normal ',
"        \ 'no' : 'N·Operator Pending ',
"        \ 'v'  : 'Visual ',
"        \ 'V'  : 'V·Line ',
"        \ '' : 'V·Block ',
"        \ 's'  : 'Select ',
"        \ 'S'  : 'S·Line ',
"        \ '' : 'S·Block ',
"        \ 'i'  : 'Insert ',
"        \ 'R'  : 'Replace ',
"        \ 'Rv' : 'V·Replace ',
"        \ 'c'  : 'Command ',
"        \ 'cv' : 'Vim Ex ',
"        \ 'ce' : 'Ex ',
"        \ 'r'  : 'Prompt ',
"        \ 'rm' : 'More ',
"        \ 'r?' : 'Confirm ',
"        \ '!'  : 'Shell ',
"        \}
"  " jamessan's
"  set statusline=   " clear the status line for when vimrc is reloaded
"  set statusline+=%{g:currentmode[mode()]}     " mode name
"  set statusline+=%3n:                         " buffer number
"  set statusline+=%f\                          " file name
"  set statusline+=%h%m%r%w                     " flags
"  set statusline+=[%{strlen(&ft)?&ft:'none'},  " file type
"  set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"  set statusline+=%{&fileformat}]              " file format
"  set statusline+=%{HasPaste()}                " show Paste mode
"  set statusline+=%=                           " right align
"  set statusline+=%b,0x%-8B\                   " current char
"  set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
"
"end
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Editing mappings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Move a line up/down
"nnoremap <A-j>    :m .+1<CR>==
"nnoremap <A-k>    :m .-2<CR>==
"inoremap <A-j>    <Esc>:m .+1<CR>==gi
"inoremap <A-k>    <Esc>:m .-2<CR>==gi
"
"" Move selected lines up/down
"vnoremap <A-j>    :m '>+1<CR>gv=gv
"vnoremap <A-k>    :m '<-2<CR>gv=gv
"
"" Delete trailing white space on save, useful for Python
"func! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunc
"autocmd BufWrite *.py         :call DeleteTrailingWS()
"autocmd BufWrite *.sh         :call DeleteTrailingWS()
"autocmd BufWrite *.pl,*pm     :call DeleteTrailingWS()
"
"" Quickly edit the vimrc file in a new tab
"nmap <silent> <LEADER>ev    :tabedit $MYVIMRC<CR>
"
"" Quickly source the vimrc file
"nmap <silent> <LEADER>sv    :source $MYVIMRC <bar> echon "source done." <bar> sleep 750m<CR>
"
"" Fast saving
"nnoremap <LEADER>w          :w!<CR>
"
"" Fast saving all tabs
"nnoremap <LEADER>W          :wa!<CR>
"
"" Start a bash within vim
"nnoremap <LEADER>r          :!bash<CR>
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Function key mappings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""       Norm            Shift           Ctrl            Alt
"" F1    help            -               help            -
"" F2    folding         -               -               -
"" F3    V-split         H-split         -               -
"" F4    toggle_matches  toggle_case     X               X
"" F5    toggle_line_no  toggle_paste    X               SpellCheck
"" F6    gundo           -               -               -
"" F7    TagbarToggle    toggle_past     X               toggle_bg_color
"" F8    -               -               toggleTagBar    toggle_list
"" F9    ToggleSyntax    toggle_whitespc -               -
"" F10   X               -               -               -
"" F11   show_spaces     trim_spaces     -       -
"" F12   -               -               -               -
"" Note: X = system related key combinations in GUI, cannot be used by gvim
"
""
"" folding
"inoremap <F2>         <C-O>za
"nnoremap <F2>         za
"onoremap <F2>         <C-C>za
"vnoremap <F2>         zf
"
"" open vertical explorer window
"nnoremap <F3>         :Vexplore<CR>
"nnoremap <s-F3>       :Hexplore<CR>
"
"" toggle highlighted matches
"nnoremap <F4>         :set hlsearch!<CR>
"
"" toggle case sensitivity for searching
"nnoremap <S-F4>       :set ignorecase! <bar> set ignorecase?<CR>
"
"" Toggle line number
"nnoremap <F5>         :call NumberToggle("next")<CR>
"inoremap <F5>         <ESC>:call NumberToggle("next")<CR>i
"vnoremap <F5>         <ESC>:call NumberToggle("next")<CR>gv
"
"" Toggle paste feature
"set pastetoggle=<S-F5>
"
"" Toggle spellcheck
"nnoremap <A-F5>       :setlocal spell! spelllang=en_us<CR>
"
"" Toggle background color between dark and light
"nnoremap <A-F7>       :ToggleBG<CR>
"
"" Toggles view of unprintable characters
"noremap <A-F8>        :set list! <bar> set list?<CR>
"
"map <F9>              :call ToggleSyntaxHighlighting()<CR>
"
"" Toggle displaying white-space characters.
"noremap <s-F9>        :set list!<CR>
"
"
"" For plugin vim-better-whitespace
"if v:version > 703
"
"  " Toggle trailing white-spaces
"  nnoremap <F11>        :ToggleWhitespace<CR>
"
"  " Trim trailing spaces
"  nnoremap <S-F11>      :StripWhitespace<CR>
"
"endif
"
""
"" Font size change
"" ... increase font size <Ctrl><+>
"inoremap <C-kPlus>    <ESC>:call EnlargeFont()<CR>i
"nnoremap <C-kPlus>    :call EnlargeFont()<CR>
"
"" ... decrease font size <Ctrl><->
"inoremap <C-kMinus>   <ESC>:call ShrinkFont()<CR>i
"nnoremap <C-kMinus>   :call ShrinkFont()<CR>
"
"" ... set font size to default value <Ctrl><0>
"inoremap <C-k0>       <ESC>:call SetDefaultFontSize()<CR>i
"nnoremap <C-k0>       :call SetDefaultFontSize()<CR>
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Template handling {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" define the template names
"autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template
"
"" Create the 'tags' file (may need to install ctags first!)
"command! MakeTags     !ctags -R .
"
"" Tweaks for file browsing
"let g:netrw_banner       = 0        " disable annoying banner
"let g:netrw_browse_split = 4  " open in prior window
"let g:netrw_altv         = 1          " open splits to the right
"let g:netrw_liststyle    = 3     " tree view
"let g:netrw_list_hide    = netrw_gitignore#Hide()
"let g:netrw_list_hide   .= ',\(^\|\s\s\)\zs\.\S\+'
"" NOW WE CAN:
"" - :edit a folder to open a file browser
""    - <CR>/v/t to open in an h-split/v-split/tab
"" - check |netrw-browse-maps| for more mappings
"
"
"" Insert Filename, type the keys very fast!
"" Insert file name without extension
"inoremap \fn <C-R>=expand("%:t:r")<CR>
"" Insert file name and keep extension
"inoremap \fe <C-R>=expand("%:t")<CR>
"" Insert file name with extension and absolute directory
"inoremap \ff <C-R>=expand("%:p")<CR>
"" Insert absolute path of the directory
"inoremap \pa <C-R>=expand("%:p:h")<CR>
"" Insert relative path of directory
"inoremap \pr <C-R>=expand("%:h")<CR>
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Spell checking {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"" Shortcuts using <LEADER>
"
"" Pressing ,ss will toggle spell checking
"map <LEADER>ss      :setlocal spell!<CR>
"" Move to next misspelled word after the cursor.
"map <LEADER>sn      ]s
"" Move to previous misspelled word after the cursor.
"map <LEADER>sp      [s
"" add word under cursor to first 'spellfile'
"map <LEADER>sa      zg
"" correct word under cursor
"map <LEADER>sc      z=
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Plugin Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"" Syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list            = 1
"let g:syntastic_check_on_open            = 1
"let g:syntastic_check_on_wq              = 0
"
"" Looks up Perl command under cursor when K is pressed
"set keywordprg=perldoc\ -f
"
"" Setting for EasyAlign
"" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)
"
"" gundo
"nnoremap <F6>           :GundoToggle<CR>
"
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Misc {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remove the Windows ^M - when the encodings gets messed up
"noremap <LEADER>m     mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
"
"" Quickly open a buffer for scribble
"map <LEADER>q         :e ~/buffer<CR>
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Helper functions {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"" Helper function for VisualSelection()
"function! CmdLine(str)
"  exe "menu Foo.Bar :" . a:str
"  emenu Foo.Bar
"  unmenu Foo
"endfunction
"
"
""""
"" Handling for * and #
"function! VisualSelection(direction) range
"  let l:saved_reg = @"
"  execute "normal! vgvy"
"
"  let l:pattern = escape(@", '\\/.*$^~[]')
"  let l:pattern = substitute(l:pattern, "\n$", "", "")
"
"  if a:direction == 'b'
"    " Select to below
"    execute "normal ?" . l:pattern . "^M"
"  elseif a:direction == 'gv'
"    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
"  elseif a:direction == 'replace'
"    call CmdLine("%s" . '/'. l:pattern . '/')
"  elseif a:direction == 'f'
"    " Select to front
"    execute "normal /" . l:pattern . "^M"
"  endif
"
"  let @/ = l:pattern
"  let @" = l:saved_reg
"endfunction
"
"
"
""""
"" Returns a string with a content that is related to the status
"" of paste mode.
"function! HasPaste()
"  if &paste
"    return ' | PASTE MODE'
"  endif
"  return '             '
"endfunction
"
"
"
""""
"" Don't close window, when deleting a buffer
"command! Bclose call <SID>BufcloseCloseIt()
"function! <SID>BufcloseCloseIt()
"  let l:currentBufNum = bufnr("%")
"  let l:alternateBufNum = bufnr("#")
"
"  if buflisted(l:alternateBufNum)
"    buffer #
"  else
"    bnext
"  endif
"
"  if bufnr("%") == l:currentBufNum
"    new
"  endif
"
"  if buflisted(l:currentBufNum)
"    execute("bdelete! ".l:currentBufNum)
"  endif
"endfunction
"
"
"
""""
"" Tab headings
"" set up tab labels with tab number, buffer name, number of windows
"function! GuiTabLabel()
"  let label = ''
"  let bufnrlist = tabpagebuflist(v:lnum)
"  " Add '+' if one of the buffers in the tab page is modified
"  for bufnr in bufnrlist
"    if getbufvar(bufnr, "&modified")
"      let label = '+'
"      break
"    endif
"  endfor
"  " Append the tab number
"  let label .= v:lnum.': '
"  " Append the buffer name
"  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
"  if name == ''
"    " give a name to no-name documents
"    if &buftype=='quickfix'
"      let name = '[Quickfix List]'
"    else
"      let name = '[No Name]'
"    endif
"  else
"    " get only the file name
"    let name = fnamemodify(name,":t")
"  endif
"  let label .= name
"  " Append the number of windows in the tab page
"  let wincount = tabpagewinnr(v:lnum, '$')
"  return label . '  [' . wincount . ']'
"endfunction
"
"set guitablabel=%{GuiTabLabel()}
"
"
"
""""
"" Toggles between no number, settings of number and relative number.
"" Usage: F5      in modes: normal, insert and visual
""
"if v:version > 703
"
"  function! NumberToggle(number_type)
"    let donext = a:number_type
"    " get the next number type
"    if(a:number_type == "next")
"      if(&g:relativenumber == 0 && &g:number == 0)
"        " Absolute numbers.
"        let donext = "abs-number"
"      elseif(&g:relativenumber == 0 && &g:number == 1)
"        " Relative numbers with highlighted absolute number.
"        let donext = "rel-number"
"      elseif(&g:relativenumber == 1 && &g:number == 1)
"        " Relative numbers with highlighted reference number (0).
"        let donext = "rel-number0"
"      else
"        " No line numbers.
"        let donext = "no-number"
"      endif
"    endif
"    " set the number type
"    if(donext == "no-number")
"      " No line numbers.
"      set norelativenumber
"      set nonumber
"    elseif(donext == "abs-number")
"      " Absolute numbers.
"      set norelativenumber
"      set number
"    elseif(donext == "rel-number")
"      " Relative numbers with highlighted absolute number.
"      set relativenumber
"      set number
"    else
"      " Relative numbers with highlighted reference number (0).
"      set relativenumber
"      set nonumber
"    endif
"  endfunction
"
"
"else
"
"  function! NumberToggle(type)
"    " type has a dummy function!
"    set number!
"  endfunction
"
"endif
"
"
""""
""
"function! CloseHiddenBuffers()
"  " Tableau pour memoriser la visibilite des buffers
"  let visible = {}
"  " Pour chaque onglet...
"  for t in range(1, tabpagenr('$'))
"    " Et pour chacune de ses fenetres...
"    for b in tabpagebuflist(t)
"      " On indique que le buffer est visible.
"      let visible[b] = 1
"    endfor
"  endfor
"  "
"  " Pour chaque numero de buffer possible...
"  for b in range(1, bufnr('$'))
"    " Si b est un numero de buffer valide et qu'il n'est pas visible, on le
"    " supprime.
"    if bufexists(b) && !has_key(visible, b)
"      " On ferme donc tous les buffers qui ne valent pas 1 dans le tableau et qui
"      " sont pourtant charges en memoire.
"      execute 'bwipeout' b
"    endif
"  endfor
"endfunction
"" :call CloseHiddenBuffers()
"
"
"
""""
""
"function! ToggleSyntaxHighlighting()
"  if exists("g:syntax_on")
"    syntax off
"  else
"    syntax enable
"  endif
"endfunction
"
"
""
"" WordProcessorMode()
"" Make paragraph and press gq
"function! WordProcessorMode()
"  setlocal formatoptions=1
"  setlocal noexpandtab
"  " correct word under cursor
"  map ?           z=
"  " Treat long lines as break lines (useful when moving around in them)
"  map j           gj
"  map k           gk
"  setlocal spell spelllang=en_us
"  set thesaurus+=/home/${USER}/.vim/thesaurus/mthesaur.txt
"  set complete+=s
"  setlocal wrap
"  setlocal linebreak
"  setlocal textwidth=70
"endfunction
"
"command! WP call WordProcessorMode()
"
"
"
"function! SetupAirline()
"  " Format the status line
"" if exists("g:loaded_airline")
"    " Airline loaded
"
"    " Settings for bling/vim-airline
"    let g:airline_powerline_fonts = 1
"
"    " Smarter tab line
"    let g:airline#extensions#tabline#enabled = 1
"
"    let g:airline#extensions#tabline#show_tab_nr = 1
"    let g:airline#extensions#tabline#buffer_nr_show = 1
"
"    if !exists('g:airline_symbols')
"      let g:airline_symbols = {}
"    endif
"    let g:airline_symbols.space = "\ua0"
"
"" endif
"endfunction
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" => Finalize Setting {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"" Finish setup of plugins
"autocmd VimEnter * call SetupPluginOptions()
"echo 567
"









""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab
