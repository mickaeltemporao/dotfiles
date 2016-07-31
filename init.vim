" Vim File
" ------------------------------------------------------------------------------
" Title:        Vim Configuration
" Filename:     init.vim
" Description:  Configuration File for Vim & NeoVim
" Version:      0.0.0.001
" Created:      2015-11-19 14:33:31
" Modified:     2016-07-31 11:17:44
" Author:       Mickael Temporão < mickael.temporao.1 at ulaval.ca >
" ------------------------------------------------------------------------------
" Copyright (C) 2016 Mickael Temporão
" Licensed under the GPL-2 < https://www.gnu.org/licenses/gpl-2.0.txt >
" ------------------------------------------------------------------------------

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins handled with vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/autoload')

" Make sure you use single quotes
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/header.vim'
Plug 'vim-scripts/LanguageTool'

" Add plugins to &runtimepath
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader to space bar
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Handling swap files
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swp//

" Case Insensitive search
set ignorecase

" Buffer Switch without saving
set hidden


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
set number

" Use spaces instead of tabs
set expandtab

" Change the cursor shape in the terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Set colorscheme
set background=dark    " Setting dark mode
colorscheme solarized

" Icons
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

"Recognize Tex Files
let g:tex_flavor='latex'

"Yank path command with leader cp"
nnoremap <silent> cp :let @*=expand("%:p")<CR>

"Height of Command line area
set cmdheight=1

" Word wrap without line breaks
set wrap
set linebreak
set nolist  " list disables linebreak

" For regular expressions turn magic on
set magic

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always use the systme clipboard
set clipboard+=unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Opens a new split with terminal
map <leader>vt :vsp <cr>:term<cr>

" Opens a new window with terminal
map <leader>tt :tabedit<cr>:term<cr>

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader> ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"Convert cases with ~ to Caps, Lower, Title
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

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

" Remove diacritical signs from characters in specified range of lines.
" Examples of characters replaced: á -> a, ç -> c, Á -> A, Ç -> C.
function! s:RemoveDiacritics(line1, line2)
  let diacs = 'áâãàçéêíóôõüú'  " lowercase diacritical signs
  let repls = 'aaaaceeiooouu'  " corresponding replacements
  let diacs .= toupper(diacs)
  let repls .= toupper(repls)
  let all = join(getline(a:line1, a:line2), "\n")
  call setline(a:line1, split(tr(all, diacs, repls), "\n"))
endfunction
command! -range=% RemoveDiacritics call s:RemoveDiacritics(<line1>, <line2>)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost vimrc source ~/.config/nvim/init.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.config/nvim/temp_dirs/undodir
    set undofile
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Airline configuration
set laststatus=2
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#tmuxline#enabled = 1

" Disable underscore shortcut in Nvim-R
let R_assign = 0

"R Code linter
"let g:neomake_javascript_enabled_makers = ['jshint']
"let g:syntastic_enable_r_lintr_checker = ['lintr']
"let g:syntastic_r_checkers = 1

"R Tabulation Behaviour
"autocmd FileType R setlocal shiftwidth=2 tabstop=2

"FuGitive status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"LanguageTool Setup
let g:languagetool_jar='/usr/local/Cellar/languagetool/3.2/libexec/languagetool-commandline.jar'

" ctrlP
" Open buffer menu
nnoremap <Leader>o :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Nerd Tree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
