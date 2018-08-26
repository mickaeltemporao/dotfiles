"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Python Plugins
" Plug 'davidhalter/jedi-vim'
Plug 'jalvesaq/vimcmdline'
" Plug 'maralla/completor.vim'
" Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'

" Writing Plugins
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'dbmrq/vim-ditto'
" Plug 'reedes/vim-wordy'
Plug 'junegunn/goyo.vim'
" Plug 'rhysd/vim-grammarous'
" Plug 'vim-pandoc/vim-rmarkdown'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Set System Clipboard by default
if $TMUX == ''
        set clipboard+=unnamed
    endif

" Map leader to space bar
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>

" Enable filetype plugins
filetype plugin indent on

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

" Word wrap without line breaks
set wrap
set linebreak
set nolist  " list disables linebreak

" Execute current file
nnoremap <F9> :!%:p

" Incremental browser search
set incsearch

" Highlight search results
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Turn persistent undo on
let vim_dir = '$HOME/.vim'
let &runtimepath.=','.vim_dir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undo_dir = expand(vim_dir . '/undodir')
    " Create dirs
    call system('mkdir ' . vim_dir)
    call system('mkdir ' . undo_dir)
    let &undodir = undo_dir
    set undofile
endif


" Tab navigation
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nord-vim ----------------
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1

" vimcmdline
let g:cmdline_app     = {"python": "ipython --no-autoindent"}
let cmdline_map_start = '<LocalLeader>t'
let cmdline_map_send  = '<c-t>'

" ctrlp ----------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Open buffer menu
nnoremap <Leader>o :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" tagbar ----------------
nmap <F10> :TagbarToggle<CR>

" Nvim-R ----------------

" vim-easy-aligna ----------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Nerd Tree ----------------
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.parquet$', '\.p$']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" vim-markdown ----------------
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Airline configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#tmuxline#enabled = 1

" vim-ditto ----------------
" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches


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
set t_Co=256

" Icons
let g:airline_powerline_fonts = 1
set guifont=Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono\ Font:h11

"Always show current position
set ruler

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*.csv,*.feather,*.aux,*.csv,*.parquet

" Enable backspace normal behaviour
set backspace=indent,eol,start

" For regular expressions turn magic on
set magic

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Quickly open a buffer for scribble
map <leader>q :e ~/googledrive/buffer.md<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/googledrive/buffer.py<cr>

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

"Toggle Spelling On/Off & Switch
function! ToggleSpellLang()
    " toggle between en and fr
    if &spelllang =~# 'en'
        :set spelllang=fr
    else
        :set spelllang=en
    endif
endfunction
nnoremap <F7> :setlocal spell!<CR> " toggle spell on or off
nnoremap <F8> :call ToggleSpellLang()<CR> " toggle language


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
" Proper PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LaTeX Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = "latex"


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

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/googledrive/buffer.md<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/googledrive/buffer.R<cr>

" Create the 'tags' file (requires ctags ? brew install ctags)
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

command! MakeTags !ctags -R .
