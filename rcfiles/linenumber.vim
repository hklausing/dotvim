

" Display relative line numbers, with absolute line number for current line
set number
set numberwidth=5
"set relativenumber

"""
" Toggles between no number, settings of number and relative number.
" Usage: F5      in modes: normal, insert and visual
"
if v:version > 703

  function! NumberToggle(number_type)
    let donext = a:number_type
    " get the next number type
    if(a:number_type == "next")
      if(&g:relativenumber == 0 && &g:number == 0)
        " Absolute numbers.
        let donext = "abs-number"
      elseif(&g:relativenumber == 0 && &g:number == 1)
        " Relative numbers with highlighted absolute number.
        let donext = "rel-number"
      elseif(&g:relativenumber == 1 && &g:number == 1)
        " Relative numbers with highlighted reference number (0).
        let donext = "rel-number0"
      else
        " No line numbers.
        let donext = "no-number"
      endif
    endif
    " set the number type
    if(donext == "no-number")
      " No line numbers.
      set norelativenumber
      set nonumber
    elseif(donext == "abs-number")
      " Absolute numbers.
      set norelativenumber
      set number
    elseif(donext == "rel-number")
      " Relative numbers with highlighted absolute number.
      set relativenumber
      set number
    else
      " Relative numbers with highlighted reference number (0).
      set relativenumber
      set nonumber
    endif
  endfunction


else

  function! NumberToggle(type)
    " type has a dummy function!
    set number!
  endfunction

endif



" Show line numbers at startup with absolute numbers; Toggel of this
" feature is assigned to F5.
autocmd BufReadPost * call NumberToggle("rel-number")

" Toggle line number
nnoremap <F5>         :call NumberToggle("next")<CR>
inoremap <F5>         <ESC>:call NumberToggle("next")<CR>i
vnoremap <F5>         <ESC>:call NumberToggle("next")<CR>gv

map <LEADER>n         :call NumberToggle("next")<CR>


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
