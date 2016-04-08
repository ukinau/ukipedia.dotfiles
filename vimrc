autocmd BufNewFile,BufRead *.c e ++enc=utf8
set number
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set hlsearch
set cursorline

let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
let Tlist_Show_One_File = 1    "現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1  "右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1   "taglistのウインドウだけならVimを閉じる
nnoremap <C-d> :NERDTree<CR>
nnoremap <C-l> :TlistToggle<CR>

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
"----------------------------------------------------
"   neobundle
"   "
"   -------------------------------------------------
"
set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f
" your_machines_makefile
"
NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
                \ 'windows' : 'make -f make_mingw32.mak',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'unix' : 'make -f make_unix.mak',
        \ },
        \ }


filetype plugin indent on     " Required!


" Brief help
" " :NeoBundleList          - list configured bundles
" " :NeoBundleInstall(!)    - install(update) bundles
" " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused
" bundles
"
" " Installation check.
"
NeoBundleCheck

NeoBundle 'scrooloose/nerdtree'
NeoBundle "vim-scripts/taglist.vim"
NeoBundle "scrooloose/syntastic"
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()

syntax enable
set background=dark    " we can choose dark or light
colorscheme solarized
