set listchars=tab:>-,trail:■,extends:>,precedes:<,nbsp:%
autocmd BufNewFile,BufRead *.c e ++enc=utf8
set number
set tabstop=2 " Amount when you try to insert tab with just pushing tab key
set shiftwidth=2 " Amount when you try to insert tab with vim command like >

set expandtab " Replace tab with space
set autoindent

syntax on
filetype on
filetype indent on
filetype plugin on

set hlsearch
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE

nnoremap <C-d> :NERDTree<CR>

inoremap <C-h>  <Left>
inoremap <C-j>  <Down>
inoremap <C-k>  <Up>
inoremap <C-l>  <Right>
inoremap <Leader>p <ESC>pi
inoremap <Leader>k <ESC>d$i
inoremap [] []<Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

"-------------------------------------------------
"   neobundle
"-------------------------------------------------
  ";Note: Skip initialization for vim-tiny or vim-small.
  if 0 | endif

  if &compatible
    set nocompatible               " Be iMproved
  endif
 
  ";Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
 
  ";Required:
  call neobundle#begin(expand('~/.vim/bundle/'))
 
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle "scrooloose/syntastic"
  
    NeoBundle 'altercation/vim-colors-solarized'
  
    NeoBundleLazy 'fatih/vim-go', {
                \ 'autoload' : { 'filetypes' : 'go'  }
                \ }

  call neobundle#end()

 ";Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"-------------------------------------------------
"  end(neobundle)
"-------------------------------------------------

"-------------------------------------------------
"  color-scheme
"-------------------------------------------------
  set background=dark    " we can choose dark or light
  colorscheme solarized
"-------------------------------------------------
"  end(color-scheme)
"-------------------------------------------------

"-------------------------------------------------
"  Golang(dep: vim-go)
"-------------------------------------------------
  autocmd filetype go match goErr /\<err\>/
  autocmd filetype go highlight goErr cterm=bold ctermfg=Red
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
"-------------------------------------------------
"  end(Golang)
"-------------------------------------------------

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

syntax enable
set background=dark    " we can choose dark or light
colorscheme solarized

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | execute "%!xxd -r" | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END
