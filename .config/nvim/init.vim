" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'arcticicestudio/nord-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/nvim-r'
Plug 'jalvesaq/vimcmdline'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'
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

" Tab navigation
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

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
nnoremap <Leader>o :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" Ignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python environnment setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python'


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
