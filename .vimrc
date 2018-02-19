" ==============================
" Function Keys
" ==============================
" F1    help
" F2    show gundu window
" F3    toggle NerdTree on/off
" F4
" F5
" F6
" F7    run flakes8
" F8
" F9
" F10
" F11   remove trailing spaces
" F12   paste toggle


" ==============================
"       Load Pathogen
" ==============================

filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Syntax highlighting
syntax on

" Filetype detection
filetype on

" Enable loading indent file for filetype
filetype plugin indent on

" ==============================
"       General Setup
" ==============================

" Disable compatibility with vi
set nocompatible

" Set the character encoding inside Vim
set encoding=utf-8

" Default file types
set fileformats=unix,dos,mac

" Disable file backup, use writebackup instead
set nobackup
set writebackup

" Disable swap file
set noswapfile

" Never write a file unless I request it
set noautowrite
set noautowriteall

" Automatically re-read changed files
set autoread

" (Y)es (N)o (C)ancel prompt
set confirm

" Enable modeline
set modeline
set modelines=5

" Disable any kind of bell
set t_vb=
set noerrorbells
set novisualbell

" Restore screen contents when exiting Vim
set restorescreen

" Smoother redraws
set ttyfast

" Do not redraw when running macros
set lazyredraw

" Allow the backspace key to delete anything in insert mode
set backspace=indent,eol,start

" Always set autoindenting on
set autoindent

" Use smart indent if there is no indent file
set smartindent

" Automatic program indenting
set cindent

" Format options:
"		t - autowrap normal text
"		c - autowrap comments
"		q - gq formats comments
"		n - autowrap lists
"		1 - break _before_ single-letter words
"		2 - use indenting from 2nd line of para
set formatoptions=tcqn1

" Use the appropriate number of spaces to insert a <Tab>
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Round indent to multiple of shiftwidth
set shiftround

" Don't break words
set linebreak

" String to put at the start of lines that have been wrapped
set showbreak=

" Don't wrap text
set nowrap

" Virtual editing in block mode
set virtualedit=block

" Incremental search
set incsearch

" Completion recognizes capitalization
set infercase

" Highlight search terms
set hlsearch

" Ignore case when searching, but only if all letters are lowercase
set smartcase
set ignorecase

" Fold on indents
set foldmethod=indent

" Disable automatic indent
set foldlevel=99

" Display the nonprintable characters
set list

" Displays tabs with :set list & displays when a line runs off-screen
set listchars=trail:·,precedes:⇐,extends:⇒,tab:\ \ "

" Change the leader to be a comma
let mapleader=","

" Avoid moving cursor to BOL when jumping around
set nostartofline

" Enable the mouse for all modes
set mouse=a

" Use all abbreviations in messages
set shortmess=a

" Display line numbers in front of each line
set number

" Show the line and column number of the cursor position
set ruler

" Number of lines to scroll with ^U and ^D
set scroll=5

" Number of lines to keep below and above the cursor
set scrolloff=15

" Highlight the screen line of the cursor
set cursorline

" Always report changes
set report=0

" Show the current editing status
set showmode

" Briefly jump to a paren once it's balanced
set showmatch

" Display commands in the bottom right corner as they are typed
set showcmd

" Size of the history
set history=250

" Always display the status line
set laststatus=2

" Format string
set statusline=%f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Title of the window
set title
set titlestring=%F\ %m

" Display a list of matches when using command-line completion
set wildmenu
set wildmode=full
set wildignore=*.o,*.obj,*.pyc,*.pyo,*.swp,.git,*.class

" Don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview

" Keep a small completion window
set pumheight=6

" Replace the default grep program with Ack
set grepprg=ack

" Colorscheme
colorscheme dracula

" Don't outdent hashes
inoremap # #

" Close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Restore cursor to file position in previous editing session
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" |  endif

" Use a higher timeout for mappings, so that keycodes will time out first
set timeout ttimeoutlen=50

" ==============================
" Functions
" ==============================
fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

" See :help restore-position
fu! SaveCurPos()
    execute "normal msHmtgg"
endfu

" See :help restore-position
fu! RestoreCurPos()
    execute "normal 'tzt`s"
endfu

" Reformat the file
fu! FormatFile()
    call SaveCurPos()
    execute "normal gg=G"
    call RestoreCurPos()
endfu

" Remove trailing spaces
fu! RemoveTrailingSpaces()
    call SaveCurPos()
    :%s/\s\+$//e
    call RestoreCurPos()
endfu

" ==============================
"       Mappings
" ==============================

" F1

" F2

" F3: toggle NERDTreeTabs window on/off
map <F3> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" F4

" F5

" F6

" F7

" F8

" F9

" F10

" F11: remove the trailing spaces in the file
map <F11> :call RemoveTrailingSpaces()<CR>"

" F12: toggle paste on/off
set pastetoggle=<F12>

" Copy text to clipboard
map <C-c> "+y<CR>

" Paste text from clipboard
map <C-v> "+gP

" Map the escape sequences to their Alt combination
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

" Reload .vimrc 
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Ctrl + jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>


" Quit window on <leader> + q
nnoremap <leader>q :q<CR>

" hide matches on <leader> + space
nnoremap <leader><space> :nohlsearch<cr>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Split scroll
nmap <leader>sb :call SplitScroll()<CR>

" toggle the quickfix window on/off
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

" Run command-t file search
map <leader>f :CommandT<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" ==============================
" FileType specific
" ==============================
" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:virtualenv_auto_activate = 1

" Bash
au FileType sh setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent

" PHP
au FileType php setlocal expandtab

" YAML
au FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent

" RST
au FileType rst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent textwidth=120

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown setlocal textwidth=99 formatoptions+=t wrap spell

" HTML
au FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent

