"
" colorscheme
"

" Enables the syntax highlighting
syntax enable

" color handling if altercation/vim-colors-solarized is loaded
if !empty(glob("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))

  " Different colorscheme for CLI/GUI possible
  if has("gui_running")

    " Installed fonts: nerd-fonts-complete-mono-glyphs

    " use 256 colors
    set t_Co=256

    let g:solarized_termcolors = 256        " Force 256 colors, use this BEFORE! colorscheme solarized
    let g:solarized_termtrans  = 0          " Solarized will use the default background of the terminal
    let g:solarized_degrade    = 1          " forces Solarized to use the 256 degraded color
    let g:solarized_bold       = 1
    let g:solarized_underline  = 1
    let g:solarized_italic     = 1
    let g:solarized_contrast   = "normal"
    let g:solarized_visibility = "normal"   " for special characters like line-end
    let g:solarized_hitrail    = 1
    let g:solarized_menu       = 0

    set background=dark     " light is also usable

  else
    let g:solarized_termcolors = 256        " Force 256 colors, use this BEFORE! colorscheme solarized
    let g:solarized_termtrans  = 0          " Solarized will use the default background of the terminal
    let g:solarized_degrade    = 0          " forces Solarized to use the 256 degraded color
    let g:solarized_bold       = 1
    let g:solarized_underline  = 1
    let g:solarized_italic     = 1
    let g:solarized_contrast   = "normal"
    let g:solarized_visibility = "normal"   " for special characters like line-end
    let g:solarized_hitrail    = 1
    let g:solarized_menu       = 0

    set background=dark     " light is also usable

    " If power line font symboles are partially messed up
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
   "let g:airline_symbols.space = "\ua0"
    let g:airline_symbols.space = " "

  end

  " Set colorscheme of plug-in vim-colors-solarized
  colorscheme solarized

else

  " set background color to the default value dark
  set background=dark

  " set these settings if vim-colors-sloarized is not found
  colorscheme mustang         " background is handled by scheme

endif


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
