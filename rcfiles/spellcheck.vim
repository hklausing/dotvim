

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell


" Shortcuts using <LEADER>

" Pressing ,ss will toggle spell checking
map <LEADER>ss      :setlocal spell!<CR>
" Move to next misspelled word after the cursor.
map <LEADER>sn      ]s
" Move to previous misspelled word after the cursor.
map <LEADER>sp      [s
" add word under cursor to first 'spellfile'
map <LEADER>sa      zg
" correct word under cursor
map <LEADER>sc      z=



" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab filetype=vim
