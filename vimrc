""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File:
"   ${HOME}/.vim/vimrc
"
" Maintainer:
"   Heiko Klausing (h.klausing@gmx.de)
"
" Version:
"   0.0.1 - 2017-08-31
"
" Purpose:
"   This file contains the minimal settings to set the foundation,
"   with the majority of the configuration and settings living in
"   files spread between vim/rcfiles and vim/rcplugins
"
" Preparation:
"   Prepare_vim-plug:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"   Prepare font:
"
" Links:
"   - https://github.com/akrawchyk/awesome-vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif


" Source all files in a indicated directory with extension .vim
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      " Enable next line to see which files are loaded.
      "echo "execute 'source'" . config_file
      execute 'source' config_file
    endif
  endfor
endfunction

" Make Vim behave in a more useful way
set nocompatible

" Need to set the leader before defining any leader mappings
let mapleader = ","

" Insert vim plugins with additional setting
call plug#begin('~/.vim/bundle')
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

" Insert vim settings
call s:SourceConfigFilesIn('rcfiles')

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif


" vim:tabstop=2 shiftwidth=2 softtabstop=2 expandtab
