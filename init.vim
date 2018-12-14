" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/vimcmdline'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-pandoc/vim-rmarkdown'

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

" vimcmdline
let g:cmdline_app              = {"python": "ipython --no-autoindent"}
let cmdline_map_start          = '<LocalLeader>t'
let cmdline_map_send           = '<c-s>'
let cmdline_vsplit             = 0
let cmdline_term_width         = 80
let cmdline_term_heigth        = 24
let cmdline_in_buffer          = 1
let cmdline_follow_colorscheme = 1

" Airline configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#tmuxline#enabled = 1

" vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R environnment setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO: Fix R Tabulation Behaviour for Neovim

"TODO: SETUP R Code linter
" let g:syntastic_enable_r_lintr_checker = 1
" let g:syntastic_r_checkers = ['lintr']

" Disable underscore shortcut in Nvim-R
let R_assign = 0

" Set R Tabulation Behaviour
autocmd FileType r setlocal shiftwidth=2 tabstop=2

" Set file type for RMarkdown files
autocmd BufNewFile,BufRead *.Rmd   set filetype=rmarkdown
