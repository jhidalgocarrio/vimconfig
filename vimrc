filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/pyclewn/
let $PATH .= ":" . $HOME . "/.vim/bundle/pyclewn-bin/bin"
let $PYTHONPATH .= ":" . $HOME . "/.vim/bundle/pyclewn-bin/lib/python"
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'

	
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"End Plugin Manager

let mapleader =","
syntax enable
filetype plugin indent on
set ofu=syntaxcomplete#Complete

" Replace $RSENSE_HOME with the directory where RSense was installed
" let g:rsenseHome = "$RSENSE_HOME"
" let g:rsenseUseOmniFunc = 1

"improve autocomplete menu color
highlight PMenu     cterm=bold ctermbg=Gray ctermfg=Black
highlight PMenuSel  cterm=bold ctermbg=Red ctermfg=Gray

"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
 
" Add recently accessed projects menu (project plugin)
set viminfo^=!
 
" Minibuffer Explorer Settings
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
 
" alt+n or alt+p to navigate between entries in QuickFix
"map <silent> <m-p> :cp <cr>
"map <silent> <m-n> :cn <cr>

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme

" Search
set ignorecase		" Do case insensitive matching
set smartcase           " Fall back to case sensitive if search pattern has a upper case character
set incsearch		" Incremental search
set hlsearch            " Highlight search 
map <F10> :nohlsearch<CR>   " Temporarily disable highlighting, reenabled for the next search

" Tab and indent handling
set smarttab
set shiftwidth=4  " Tabs under smart indent
set softtabstop=4
set tabstop=8
set expandtab
set cinwords=if,else,while,do,for,switch,case


set bs=2  " Backspace over everything in insert mode
set nocp incsearch
set cinoptions=:0,p0,t0
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
 
" Status line
set showcmd		" Show (partial) command in status line.
set showmode            " Display current mode (insert, replace, ...)
set laststatus=2        " Always display status line
set statusline=%f\ %h%r\ %=%l/%L,%c%10.n%5.P
set statusline=%-40.40f%<\ [%.20{getcwd()}]%h%r\ %=%l/%L,%c%10.n%14.PM

"Save and restore last position in buffer
:au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list

"Ignore whitespace changes by default in diff
set diffopt=filler,iwhite
if v:version >= 700
    set diffopt+=vertical
endif
set encoding=utf-8
set shellpipe=2>&1\|\ tee\ -i
set wildmenu
set textwidth=80


" Show $ at end of line and trailing space as ~ eol:$,
set lcs=tab:\ \ ,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
 
" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

"if has("syntax")
"  syntax on
"endif

colorscheme elflord 

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set spell "Spell checker ON

"Hardcopy printing to pdf
set pdev=pdf
set printoptions=paper:A4,syntax:y,wrap:y,duplex:long


let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
