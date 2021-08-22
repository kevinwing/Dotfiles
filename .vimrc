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
    Plug 'w0rp/ale'
    Plug 'valloric/youcompleteme'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'

call plug#end()

filetype plugin on
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
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

""" The Nerd Commenter Settings

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
