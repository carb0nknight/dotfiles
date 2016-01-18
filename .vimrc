"-------[ Vim Config ]----------------------------------------
set mouse=a                                                 " Enable mouse support in all modes
set number                                                  " Show line numbers
set numberwidth=                                            " set number column width to 5 characters
set ruler                                                   " Show line number on statusbar
set cursorline                                              " highlight current line
set magic                                                   " For regular expressions turn magic on
set wrap                                                    " soft wrap long lines
set clipboard=unnamedplus                                   " enable clipboard
set pastetoggle=<F12>                                       " pastetoggle (sane indentation on pastes)
set showmode                                                " Show mode
set showcmd                                                 " This shows what you are typing as a command
set cmdheight=1                                             " Command line height
set laststatus=2                                            " Always show the statusline
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]      " Status line format
set history=1000                                            " Number of history lines
set undodir=~/.vim/undo/
set undofile
set undolevels=1000                                         " # of undo steps
set undoreload=10000
set list                                                    " show invisible characters
set listchars=tab:>·,trail:·                                " but only show tabs and trailing whitespace
set guioptions-=T                                           " removes toolbar from gvim
set hl=l:Visual                                             " use Visual mode's highlighting scheme --much better
set virtualedit=all                                         " allows the cursor to stray beyond defined text
set noautowrite                                             " don't automagically write on :next
set lazyredraw                                              " Don't redraw while executing macros (good performance config)
set ttyfast                                                 " send more characters for redraw
set encoding=utf8                                           " Set utf8 as standard encoding and en_US as the standard language
au WinLeave * set nocursorline nocursorcolumn               " highlight vertical column of cursor

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

map <F2> :set paste<CR>i                                    " key to insert mode with paste using F2 key
au InsertLeave * set nopaste                                " Leave paste mode on exit

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" convert hash rockets
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

let g:ruby_path="~/.rvm/bin/ruby"
let g:jsx_ext_required = 0                                   " have jsx highlighting/indenting work in .js files as well

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>

"-------[ Filetype Plugins ]----------------------------------------
filetype on
filetype plugin on
filetype plugin indent on
syntax enable

"-------[ Spacing and Indentation ]----------------------------------------
set autoindent                                              " set the cursor at same indent as line above
set smartindent                                             " try to be smart about indenting (C-style)
set expandtab                                               " expand <Tab>s with spaces; death to tabs!
set shiftwidth=3                                            " spaces for each step of (auto)indent
set softtabstop=3                                           " set virtual tab stop (compat for 8-wide tabs)
set tabstop=3                                               " for proper display of files with tabs
set shiftround                                              " always round indents to multiple of shiftwidth
set copyindent                                              " use existing indents for new indents
set preserveindent                                          " save as much indent structure as possible
set smarttab                                                " uses shiftwidth for inserting s

set backspace=eol,start,indent                              " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

"-------[ Folding ]----------------------------------------
set foldenable                                              " enable folding
set foldlevelstart=10                                       " open most folds by default
set foldnestmax=10                                          " 10 nested fold max
set foldmethod=indent                                       " fold based on indent level

"-------[ Wildmenu settings ]----------------------------------------
set wildmenu
set wildmode=list:longest,longest:full,full

"-------[ Search settings ]----------------------------------------
set incsearch                                               " incremental search
set ignorecase                                              " search ignoring case
set smartcase                                               " AI
set hlsearch                                                " highlight the search
set showmatch                                               " show matching bracket
set diffopt=filler,iwhite                                   " ignore all whitespace and sync
set showmatch                                               " causes cursor to jump to bracket match
set mat=5                                                   " how many tenths of a second to blink matches
set grepprg=grep\ -nH\ $*" Spacing

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
   " Use Ag over Grep
   set grepprg=ag\ --nogroup
   let g:grep_cmd_opts = '--line-numbers --noheading'

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag %s -l -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"-------[ Color Settings ]----------------------------------------
" Use desired colorscheme if it's available
try
    colorscheme molokai
catch
endtry

set background=dark              " set background to dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"-------[ Mode Settings ]----------------------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"-------[ Map Leader ]----------------------------------------
let mapleader = ","
let g:mapleader = ","

"-------[ Command Aliases ]----------------------------------------
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

"-------[ Helper Functions ]----------------------------------------


"-------[ Misc ]----------------------------------------
" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Remember info about open buffers on close
set viminfo^=%

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
