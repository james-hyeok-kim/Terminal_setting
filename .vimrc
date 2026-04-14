" ============================================================
"  General Settings
" ============================================================
set nocompatible              " required by Vundle
set encoding=utf-8
set backspace=indent,eol,start

" ============================================================
"  Syntax & Filetype
" ============================================================
syntax on
filetype off                  " temporarily off for Vundle init

" SystemVerilog syntax (requires ~/.vim/syntax/systemverilog.vim)
au BufNewFile,BufRead *.sv,*.svh so $HOME/.vim/syntax/systemverilog.vim

" ============================================================
"  Indentation
" ============================================================
set autoindent
set cindent
set ts=4
set shiftwidth=4
set expandtab                 " tab -> spaces

" ============================================================
"  UI
" ============================================================
set nu
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set showmatch                 " 일치하는 괄호 하이라이팅
set scrolloff=5               " 커서 위아래 여백 유지
set nowrap
set cursorline                " 현재 줄 강조
colorscheme desert

set guifont=DejaVu\ Sans\ Mono\ Book\ 14
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" ============================================================
"  Search
" ============================================================
set hlsearch
set ignorecase
set smartcase                 " 대문자 포함 시 대소문자 구별

" ============================================================
"  Clipboard & History
" ============================================================
set clipboard=unnamedplus
set history=500

" ============================================================
"  Restore cursor position
" ============================================================
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "norm g`\"" |
  \ endif

" ============================================================
"  Vundle Plugin Manager
" ============================================================
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on

" ============================================================
"  NERDTree
" ============================================================
nmap <C-f> :NERDTreeFind<CR>
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
