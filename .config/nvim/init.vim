" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/nvim-r'
Plug 'jalvesaq/vimcmdline'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TESTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In insert mode use 'qw' as Escape key
    :inoremap qw <esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SECTION TBD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid conceal markers.
" set conceallevel=0

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" delete trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" ignore case
set ic

" vim-colors
colorscheme nord

" Show line numbers
set number

" avoid wrapping lines in the middle of a word
set linebreak

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

" Replace tab with 4 spaces
set shiftwidth=4
set tabstop=4

" Fast saving
nmap <leader>s :w!<cr>

" Persistent undo
set undofile
set undodir=~/.config/nvim/undo

" Read .pdf, .doc, .odt, .rtf in vim!
autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

" tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap tn  :tabnew<CR>
nnoremap td  :tabclose<CR>

" netrw
let g:netrw_liststyle = 3
let g:netrw_altv = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimcmdline
let g:cmdline_app              = {"python": "ipython --no-autoindent"}
let cmdline_map_start          = '<LocalLeader>t'
let cmdline_map_send           = '<c-s>'
let cmdline_vsplit             = 0
let cmdline_term_width         = 80
let cmdline_term_heigth        = 24
let cmdline_in_buffer          = 1
let cmdline_follow_colorscheme = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vimwiki
let g:vimwiki_list = [ {'path': '~/Documents/notes', 'syntax': 'markdown', 'ext': '.gpg.wiki'}]

" vim-gnupg
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.wiki\)\='
" Armor files
let g:GPGPreferArmor=1
" Set the default option
let g:GPGDefaultRecipients=["mickael.temporao@gmail.com"]

" ctrlP
" Open buffer menu
nnoremap <Leader>f :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>o :CtrlPMRUFiles<CR>
" Ignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LaTeX Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
" let g:vimtex_complete_bib = { 'simple': 1 }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R environnment setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO: Fix R Tabulation Behaviour for Neovim

"TODO: SETUP R Code linter
" let g:syntastic_enable_r_lintr_checker = 1
" let g:syntastic_r_checkers = ['lintr']

" Disable underscore shortcut in Nvim-R
let R_assign = 0

" Set R Tabulation Behaviour
autocmd FileType r setlocal shiftwidth=2 tabstop=2

" Set file type for RMarkdown files
autocmd BufNewFile,BufRead *.Rmd set filetype=rmarkdown

"radian Nvim-R support
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python environnment setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" vifm pdf scrolling
" map > :!vifmimg inc<CR>
" map < :!vifmimg dec<CR>
