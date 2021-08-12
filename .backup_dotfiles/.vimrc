" The .vimrc of Kevin Wing
" date: 07-25-2021
"-------------------------
set nocompatible
filetype off
set encoding=utf-8

" Ensure vim-plug is installed, works for vim or neovim.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

    Plug 'itchyny/lightline.vim'

call plug#end()

filetype plugin indent on

"set modelines=0

set number
set incsearch
set hlsearch
set nobackup
set noswapfile
syntax enable

set laststatus=2
set noshowmode

"set ruler

"set visualbell

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

:imap ii <Esc>

