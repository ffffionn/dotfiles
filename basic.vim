"""""""""""""""""""""""""""""""""""""""""
" Author:
"   Fionn O'Connor
"
"""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""
" - Functional
""""""""""""""""""""""""""""""""""""""""""

set nocompatible             " leave the 1980s
syntax enable                " syntax highlighting
set path+=**                 " recursively search sub-dirs
set expandtab                " tabs to spaces
set shiftwidth=4             " 4 spaces per tab
set tabstop=4                " tabs in file use 4 spaces
set mouse=a                  " mouse usable in all modes
set autoread                 " auto read file when changed while open
set history=1000             " command history
set hidden                   " allows switching between unsaved buffers
set scrolloff=10             " set 10 lines to the edge of screen
set sidescrolloff=5
set visualbell               " visual cue instead of audio on error
set report=0                 " show all substitutions



"""""""""""""""""""""""""""""""""""""""""
" - Swaps, Backups, Undo
""""""""""""""""""""""""""""""""""""""""""

" no backups
set nobackup

" setup swap
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p")
endif

" // after each means files will have full paths (seperator subbed for %)
set directory=~/.vim/swap//


" setup persistent undos
if has("persistent_undo")
    if !isdirectory($HOME."/.vim/undo")
        call mkdir($HOME."/.vim/undo", "p")
    endif
    set undodir=~/.vim/undodir//
    set undofile
endif



"""""""""""""""""""""""""""""""""""""""""
" - Visual
""""""""""""""""""""""""""""""""""""""""""

set showmatch                       " show matching brackets
set mat=2                           " tenths of a second to blink on bracket
set cursorline                      " highlight current line
set showcmd                         " show incomplete commands
set number                          " show line numbers
set relativenumber                  " show relative to current line
set numberwidth=5                   " wider number column (to cater for gitgutter)
set showbreak="+++"                 " long line wrap delimiter
set autoindent                      " match indentation of prev line
set smartindent                     " dependent on filetype
set ruler                           " show (line, col) at bottom

" visual menu for auto-complete
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.sw*,*.pyc,*.class

" better splits
set splitbelow
set splitright
set equalalways

set lazyredraw                       " only redraw window after macro is finished (performance)

" line break next word after 150 chars
set linebreak
set textwidth=150

" Colours
set t_CO=256

if !isdirectory($HOME."/.vim/colors")
    call mkdir($HOME."/.vim/colors", "p")
endif

try
    colorscheme atom-dark-256
catch
    colorscheme desert
endtry



"""""""""""""""""""""""""""""""""""""""""
" - Search
""""""""""""""""""""""""""""""""""""""""""

set incsearch                       " incremental search
set hlsearch                        " highlight all matches
set ignorecase                      " ignore case on search..
set smartcase                       " ..but case sensitive if one letter is upper case
set laststatus=2                    " always status bar
set backspace=indent,eol,start      " make backspace behave normally

let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'
let g:netrw_list_hide .= '\.class$,'



"""""""""""""""""""""""""""""""""""""""""
" - Status Line
""""""""""""""""""""""""""""""""""""""""""

" Override default to blank
set statusline=

set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total
set statusline+=%5*\ %*                             " Set ending space

set shm=atI                                         " Cut long messages



"""""""""""""""""""""""""""""""""""""""""
" - Key Mappings
""""""""""""""""""""""""""""""""""""""""""

" easier exit from insert
imap jk <Esc>

" yank to end of line
nnoremap Y y$

" too common a mistake [:W == :w]
command! W w

" fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>

" for navigating wrapped lines
nmap j gj
nmap k gk

" easier start/end of line
nnoremap H ^
nnoremap L $

" autocomplete menu navigation
imap <C-J> <C-N>
imap <C-K> <C-P>

" netrw
nmap - :Explore<CR>

" Default leader is \, but space is better
nnoremap <SPACE> <Nop>
let mapleader=' '

" un-highlight searches
nmap <Leader><Leader> :nohlsearch<cr>

" paste from system clipboard
nmap <Leader>p "+p

" quick edit config files
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>ep :e $HOME/.vim/plugins.vim<cr>

" save as sudo if read-only
noremap <leader>w  :w !sudo tee % > /dev/null

" buffers
nnoremap <silent> <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
" close current buffer
nmap <Leader>q :bp <BAR> bd #<CR>
" list all open buffers, waiting for input to change
nnoremap <leader>b :ls<CR> :b<space>

" tabs
nmap <Leader>t :tab new<CR>
nmap <Leader>c :tab close<CR>

" create splits
nmap <Leader>s :split<cr>
nmap <Leader>v :vsplit<cr>

" easier split navigation
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k

" resize splits with Alt+<ARROW>
nmap <silent> <A-Up> <C-W>+
nmap <silent> <A-Down> <C-w>-
nmap <silent> <A-Left> <C-w><
nmap <silent> <A-Right> <C-w>>

" indenting in visual mode, go back to visual mode on same selection
vnoremap > >gv

" easy visual mode macros
vmap @ :normal @


"""""""""""""""""""""""""""""""""""""""""
" - Auto-Commands
""""""""""""""""""""""""""""""""""""""""""

" auto source Vimrc and reload airline on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


" Return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
"Remember info about open buffers on close
set viminfo^=%

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
