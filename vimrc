"------GENERAL------"

set nocompatible             " be iMproved, required

syntax enable                " syntax highlighting
set path+=**                 " recursively search sub-dirs
set expandtab                " tabs to spaces
set shiftwidth=4             " 4 spaces per tab
set tabstop=4                " tabs in file use 4 spaces
set showmatch                " show matching brackets on hover
set mat=2                    " tenths of a second to blink on bracket
set cursorline               " highlight current line
set showcmd                  " show incomplete commands
set number                   " show line numbers
set relativenumber           " show relative to current line
set numberwidth=5            " wider number column (to cater for gitgutter)
set showmatch                " show matching brackets
set showbreak="+++"          " long line wrap delimiter
set mouse=a                  " mouse usable in all modes
set autoread                 " auto read file when changed while open
set directory=~/.vim/swap    " special directory for swap files
set backupdir=~/.vim/backups " special directory for backups

" persistent undos
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

set textwidth=80
set lbr
set tw=500

set splitbelow               " more natural splits
set splitright
set history=1000
set hidden                   " allows switching between unsaved buffers
set scrolloff=10             " set 10 lines to the edge of screen

set visualbell
set report=0

set pastetoggle=<F2>         " fixes code pasting and stupid indents


" indent overrides for certain filetypes
" [ts: file tab size, sts: edit tab size, sw: >> indent size]
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2




"------PLUGINS------"
filetype off                " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

"------VISUALS------"

set t_CO=256
colors atom-dark-256


"------SEARCHING------"

set incsearch          " incremental search
set hlsearch           " highlight all matches
set ignorecase         " ignore case on search
set smartcase          " case sensitive if one letter is upper case
set showmatch
set laststatus=2       " always status bar (Airline in this case)
set ruler
set backspace=2
set equalalways        " always split equal size

set wildmenu
set wildignore=*.o,*.obj,*.bak,*.sw*,*.pyc,*.class
let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'
let g:netrw_list_hide .= '\.class$,'


"------KEY MAPPINGS------"

" easier exit from insert
imap jk <Esc>

" yank to end of line
nnoremap Y y$

" Default leader is \, but space is better
nnoremap <SPACE> <Nop>
let mapleader=' '

" un-highlight searches
nmap <Leader><Leader> :nohlsearch<cr>

" paste from clipboard
nmap <Leader>p "+p

" quick edit config files
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>ep :e $HOME/.vim/plugins.vim<cr>
nmap <Leader>ez :e $HOME/.zshrc<cr>
nmap <Leader><Tab> :NERDTreeToggle<cr>

" save as sudo if read-only
noremap <leader>w  :w !sudo tee % > /dev/null
command! W w

" switch working directory to current buffers
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" buffers
" close current buffer
nmap <Leader>q :bp <BAR> bd #<CR>
nnoremap <C-L> :bn<CR>
nnoremap <C-H> :bp<CR>

" tabs
nmap <Leader>t :tab new<CR>
nmap <Leader>c :tab close<CR>
nmap <Leader>h :tabp<CR>
nmap <Leader>l :tabn<CR>

" splits
nmap <Leader>s :split<cr>
nmap <Leader>v :vsplit<cr>

" resize splits with Alt+<ARROW>
nmap <silent> <A-Left> <C-w><
nmap <silent> <A-Down> <C-w>-
nmap <silent> <A-Up> <C-W>+
nmap <silent> <A-Right> <C-w>>

" fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>

" navigation
nmap <C-K> 5k
nmap <C-J> 5j
nmap <C-Up> 5k
nmap <C-Down> 5j


"------STATUS LINE------"

" Override default
set statusline=
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total
set statusline+=%5*\ %*                             " Set ending space

set shm=atI                                         " Cut long messages


"------PLUGIN-OPTIONS------

let NERDTreeHijackNetrw=0

" work up to .git for working directory
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\/(node_modules)'

let g:syntastic_python_checkers = ["flake8", "python"]

" powerline on airline
let g:airline_powerline_fonts = 1
" enable buffer list top
let g:airline#extensions#tabline#enabled = 1
" show only filenmae
let g:airline#extensions#tabline#fnamemod = ':t'





"------Auto-commands------"

" auto source Vimrc and reload airline on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost $MYVIMRC AirlineRefresh
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
