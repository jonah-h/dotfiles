" define encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (this is neccessary)
set nocompatible

" plugins
call plug#begin()

Plug 'scrooloose/nerdtree'

Plug 'myusuf3/numbers.vim'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'

Plug 'morhetz/gruvbox'

Plug 'rust-lang/rust.vim'

Plug 'DingDean/wgsl.vim'

Plug 'tikhomirov/vim-glsl'

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

call plug#end()

" airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" latex
let g:vimtex_view_method = 'zathura'

" snippets
let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'


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
