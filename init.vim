" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

" vim-colors
colorscheme nord
set background=dark

" Show line numbers
set number

" Highlight Over Length Lines
set cc=80

" allow to navigate between buffers without saving
set hidden

" Set System Clipboard by default
set clipboard=unnamedplus

" Map leader to space bar
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Use spaces instead of tabs
set expandtab

" Tab navigation
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Fast saving
nmap <leader>w :w!<cr>

" Strip whitespace on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
