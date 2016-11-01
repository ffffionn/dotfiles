"------General------"

set nocompatible      " be iMproved, required

so ~/.vim/plugins.vim " source plugins file

syntax enable         " syntax highlighting
set path+=**          " recursively search sub-dirs
set expandtab         " tabs to spaces
set shiftwidth=4      " 4 spaces per tab
set tabstop=4
set mat=2
set cursorline        " highlight current line
set showcmd
set number            " show line numbers
set showmatch         " show matching brackets
set showbreak="+++"   " long line wrap delimiter
set mouse=a           " mouse usable in all modes
set autoread          " auto read file when changed while open
set directory=~/.swpFiles

set textwidth=80
set lbr
set tw=500

set splitbelow        " more natural splits
set splitright
set history=1000
set hidden            " dont force save of buffers until vim closes
set scrolloff=10      " set 10 lines to the edge of screen


set visualbell
"set noerrorbells
set report=0

set pastetoggle=<F2>  " fixes code pasting and stupid indents


"------Visuals------"

set t_CO=256
colors atom-dark-256


"------Searching------"

set incsearch          " incremental search
set hlsearch           " highlight all matches
set ignorecase         " ignore case on search
set smartcase          " case sensitive if one letter is upper case
set showmatch
set laststatus=2       " always status bar
set ruler
set backspace=2
set equalalways        " always split equal size

set wildmenu
set wildignore=*.o,*.obj,*.bak,*.sw*,*.pyc,*.class
let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'
let g:netrw_list_hide .= '\.class$,'


"------Key Mappings------"

" Default leader is \, but , is better
let mapleader=','

" easier exit from insert
imap jk <Esc>

" un-highlight searches
nmap <Leader><space> :nohlsearch<cr>

" paste from clipboard
nmap <Leader>p "+p

" yank to end of line
nnoremap Y y$

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
nmap <Leader>t :enew<cr>
    " close current buffer
nmap <Leader>q :bp <BAR> bd #<CR>
nnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>
nnoremap <C-L> :bn<CR>
nnoremap <C-H> :bp<CR>

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

" Easymotion
nmap s <Plug>(easymotion-overwin-f)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

"------Status Line------"

" Override default
set statusline=
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total
set statusline+=%5*\ %*                             " Set ending space

set shm=atI                                         " Cut long messages


"------Plugins------"
let NERDTreeHijackNetrw=0


"------Auto-commands------"

"auto source Vimrc on save"
augroup autosourcing
    autocmd!
    autocmd bufwritepost .vimrc source %
augroup END


" Starting from vim 7.3 undo can be persisted across sessions
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile 
endif


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"Remember info about open buffers on close
set viminfo^=%

" Remove trailing whitespace on save 
autocmd BufWritePre *.js, *.hs, *.html, *.css, *.scss, *.py :%s/\s\+$//e
