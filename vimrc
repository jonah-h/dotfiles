" define encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (this is neccessary)
set nocompatible

" pre-vundle config
filetype off
" vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'myusuf3/numbers.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'morhetz/gruvbox'

Plugin 'rust-lang/rust.vim'

Plugin 'DingDean/wgsl.vim'

Plugin 'tikhomirov/vim-glsl'

call vundle#end()
" post-vundle config
filetype plugin indent on

" airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" colorscheme
set t_Co=256
let g:gruvbox_termcolors=16
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'
syntax on

" indention settings
set autoindent
set smartindent
set cino=g0

" convert tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" max line width
set textwidth=120

" enable line numbering column
set number
set numberwidth=4

" min verticle cursor offset
set scrolloff=10

" enable mouse control
set mouse=n
