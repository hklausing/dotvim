" General Vim Settings
" --------------------

filetype plugin indent on


" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible              " Use the full vim feature set

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Search down into subfolders. Provides tab-completion for all
" file-related tasks.
set path+=**

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set backspace=2      " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
"set laststatus=2     " Always display the status line
set autowrite        " Automatically :write before running commands
set formatoptions-=t " Don't auto-break long lines (re-enable this for prose)

" Keep some lines visible above and below the cursor
set scrolloff=2

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab           " Use spaces instead of tabs
" Be smart when using tabs ;)
set smarttab

" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·
"set listchars=tab:»,trail:·,nbsp:·
"set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
"set listchars=tab:→\ ,trail:␣,extends:…,eol:⏎
"set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:�

" Show extra characters like line-end, tab, ...
"set list

" Use one space, not two, after punctuation.
set nojoinspaces

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Always use vertical diffs
set diffopt+=vertical

" Don't require saving before closing a buffer
set hidden

" Height of the command bar
set cmdheight=2






" Causes the left and right arrow keys, as well as h and l
set whichwrap+=<,>,h,l

" Highlight search results -> */#; function can be toggled with F4
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=1000         " timeout after <LEADER>
set ttimeoutlen=0           " pause when leaving insert mode,

" Enable mouse usage (all modes: tabs selection, text selection, text scrolling)
if has("mouse")
  set mouse=a
  set ttymouse=xterm2
endif

" new
" share windows clipboard
set clipboard+=unnamed

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile



" Backup current session
let g:session_autosave = 'no'

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif





" Linebreak on 500 characters
set linebreak       " split lines on white-spaces only
set textwidth=500   " 0 => not auto-insert line braks, but keep line wrapping

set autoindent      " Auto indent
set smartindent     " Smart indent
set wrap            " Wrap lines


" define the template names
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

" Create the 'tags' file (may need to install ctags first!)
command! MakeTags     !ctags -R .

" Tweaks for file browsing
let g:netrw_banner       = 0        " disable annoying banner
let g:netrw_browse_split = 4  " open in prior window
let g:netrw_altv         = 1          " open splits to the right
let g:netrw_liststyle    = 3     " tree view
let g:netrw_list_hide    = netrw_gitignore#Hide()
let g:netrw_list_hide   .= ',\(^\|\s\s\)\zs\.\S\+'
" NOW WE CAN:
" - :edit a folder to open a file browser
"    - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
