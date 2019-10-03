"---Vundle settings---"
set nocompatible
filetype off

set rtp+=~/.vim/vimfiles/vundle.git/
call vundle#rc()
Plugin 'shougo/neocomplete.vim'
Plugin 'Shougo/unite.vim'
Plugin 'thinca/vim-ref'
Plugin 'thinca/vim-quickrun'
Plugin 'othree/html5.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-liquid'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/emmet-vim'

filetype plugin indent on     "required!"

"---general settings---"
set noswapfile
lan en_US
set backspace=indent,eol,start
set whichwrap=b,s,[,],<,>

"--- command mode autocomplete ---"
set wildmenu " autocomplete command-mode
set history=5000 

"--- set bash alias in vim ---"
let $BASH_ENV = "~/.bash_aliases"

"---display settings---"
syntax enable
set number
set title
set tabstop=2
set smartindent
set shiftwidth=2
set ambiwidth=double

"---search settings---"
set wrapscan
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"---command settings---"
set clipboard=unnamed,autoselect

"--- JavaScript autoindent---"
filetype plugin indent on

"---NERDTree Toggle shortcut---"
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"--- Neocomplete setting ---"
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
