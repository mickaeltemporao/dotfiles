"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'arcticicestudio/nord-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nord-vim ----------------
let g:nord_italic = 1
" let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1

" ctrlp ----------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Open buffer menu
nnoremap <Leader>o :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Nvim-R ----------------

" vim-easy-aligna ----------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Nerd Tree ----------------
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Set System Clipboard by default
set clipboard=unnamed

" Map leader to space bar
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>

" Enable filetype plugins
filetype plugin indent on
"
" Fast saving
nmap <leader>w :w!<cr>

" Case Insensitive search
set ignorecase

" Sets how many lines of history VIM has to remember
set history=50

" Set to auto read when a file is changed from the outside
set autoread

" Buffer Switch without saving
set hidden

" Execute current file
nnoremap <F9> :!%:p

" Incremental browser search
set incsearch

" Highlight search results
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 3 lines scroll limit
set so=3

" Show line numbers
set number

" Highlight Over Length Lines
set cc=80

" vim-colors
colorscheme nord
set background=dark

" Icons
let g:airline_powerline_fonts = 1
set guifont=Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono\ Font:h11

"Always show current position
set ruler

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Enable backspace normal behaviour
set backspace=indent,eol,start

" For regular expressions turn magic on
set magic

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader> ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => R Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable underscore shortcut in Nvim-R
let R_assign = 0

" Set R Tabulation Behaviour
autocmd FileType r setlocal shiftwidth=2 tabstop=2

" Set file type for RMarkdown files
autocmd BufNewFile,BufRead *.Rmd   set filetype=rmarkdown



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Strip all trailing spaces before saving files.
" http://vim.wikia.com/wiki/Remove_trailing_spaces
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    if &filetype == 'mail'
  " Preserve space after e-mail signature separator
      %s/\(^--\)\@<!\s\+$//e
    else
      %s/\s\+$//e
    endif
    normal 'yz<Enter>
    normal `z
  endif
endfunction
