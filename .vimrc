let maplocalleader = ","

set nocompatible

filetype indent plugin on

syntax on

set wildmenu
set showcmd
set hlsearch
set ruler
set laststatus=2
set confirm
set visualbell
set relativenumber
set autoread
set backspace=indent,eol,start
set noerrorbells
set scrolloff=8

call plug#begin()

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'raghur/vim-ghost',{'do': ':GhostInstall'}

let g:airline_powerline_fonts=1
let g:airline_theme='deus'

setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
call plug#end()
set mouse=nicr

autocmd BufRead,BufNewFile *.tid setfiletype tid

colorscheme onedark
set number
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

