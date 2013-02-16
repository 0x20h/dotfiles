set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin on
"filetype off

set t_Co=256 " set the terminal to 256 color mode
set modelines=0
set guicursor=a:blinkon0 
set wildmenu
set showmode
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set noignorecase
set smartcase
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"set showmatch
set backspace=indent,eol,start
set number
set ruler
set showcmd
set smartindent
set hidden
set title
set nobackup
set noswapfile

syntax on

" use :set list and :set nolist
set listchars=tab:▸\ ,eol:¬
" Visible whitespace
"set list

" COLORS
colorscheme pablo
hi CursorLine cterm=bold ctermbg=black " Overwrite cursor line style
hi Folded cterm=none ctermfg=white ctermbg=black
hi Comment ctermfg=DarkGreen ctermbg=None
hi PMenu cterm=none ctermbg=black ctermfg=lightgrey
hi PMenuSel cterm=bold ctermbg=darkgrey ctermfg=white
hi StatusLine cterm=bold ctermbg=darkgreen ctermfg=white
hi StatusLineNC cterm=none ctermbg=darkred ctermfg=white
hi MatchParen ctermbg=21 cterm=bold ctermfg=white
hi SyntasticWarning ctermbg=yellow cterm=bold ctermfg=red

" DIFF VIEW
hi DiffAdd term=bold ctermbg=22 ctermfg=255
hi DiffChange term=bold ctermfg=16 ctermbg=220
hi DiffDelete term=bold ctermfg=247 ctermbg=196
hi DiffText term=reverse cterm=bold
set cursorline


" #############################################################################
" Key Mappings
" #############################################################################

" The mapleader is a custom defined leader key under which
" you can place your mappings.
let mapleader=","
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <leader>t :FufTag<CR>
nmap <leader>k :FufFile<CR>
nmap <leader>j :FufBuffer<CR>
nmap <leader>l :FufBufferTag<CR>
" CTRL-Shift-R for file search (like eclipse)
nmap <C-a> :FufCoverageFile<CR>

" diff view + diff close
nmap <leader>d :VCSVimDiff<CR>
nmap <leader>c :bd<CR>

" next/prev buffer
noremap <C-n> :bn<CR>
nnoremap <C-m> :bp<CR>

" Window width for NERDtree
let g:NERDTreeWinSize=50
map <F2> :NERDTreeToggle<cr>

" Window size for taglist
let Tlist_WinWidth=50
let Tlist_Use_Right_Window=1
map <F4> :TlistToggle<cr>
map <F3> <C-]> 

set completeopt=longest,menuone

" fast ESC
inoremap kj <ESC>
" completion like eclipse
inoremap <Nul> <C-n>

" self protection :/
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>


" #############################################################################
" LANGUAGE SPECIFIC SETTINGS
" #############################################################################

" ####################
" PHP
" ####################

" no auto newline for php files at the end of file
autocmd BufRead *.php :set binary
autocmd BufRead *.php :set noendofline
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Settings for vimdiff
if &diff
	set filetype=php
endif

" Make vim run execute_on_save.sh on save if an execute_on_save.sh 
" exeutable exists in current pwd ...
if executable('./execute_on_save.sh')
	autocmd BufWritePost * :call system('./execute_on_save.sh')
endif

" Syntastic settings
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['php'], 'passive_filetypes': ['sh', 'rst'] }

" php folding
let php_folding=1
let php_htmlInStrings=1
let php_sql_query=1
let php_noShortTags=1
set foldlevel=1

" ####################
" RsT
" ####################

" auto make rst documentations on write
au! FileType rst set textwidth=80 colorcolumn=80
au! BufWritePost *.rst :call system('make')
