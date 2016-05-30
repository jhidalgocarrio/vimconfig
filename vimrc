filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/pyclewn/
let $PATH .= ":" . $HOME . "/.vim/bundle/pyclewn-bin/bin"
let $PYTHONPATH .= ":" . $HOME . "/.vim/bundle/pyclewn-bin/lib/python"
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'taglist'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdTree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
	
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

" --------------------------------
" Ctags configuration
" --------------------------------

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set spell "Spell checker ON

" --------------------------------
"Hardcopy printing to pdf
" --------------------------------
set pdev=pdf
set printoptions=paper:A4,syntax:y,wrap:y,duplex:long


" --------------------------------
" YouCompleteMe configuration
" --------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1


" --------------------------------
" Neocomplete configuration
" --------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" --------------------------------
" NerdTree configuration
" --------------------------------
"Open the tree by default when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Ctrl+n to open the tree
map <C-t> :NERDTreeToggle<CR>

"Close vim if the only window left open is a nerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" --------------------------------
" NerdTree git Plugin configuration
" --------------------------------
" Symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
