"------General------"

set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable
set expandtab        " tabs to spaces
set shiftwidth=4     " 4 spaces per tab
set tabstop=4
set mat=2
set cursorline       " Highlight current line
set showcmd
set number
set showmatch        " Show matching brackets
set showbreak="+++"  " Long line wrap delimiter
set mouse=a          " Mouse usable in all modes
set directory=~/.swpFiles

"set list             " Show blank characters
set textwidth=80
set lbr
set tw=500
" More natural splits
set splitbelow
set splitright
set history=1000
set hidden  " buffers?

set ttyfast           " optimize for fast terminal?

set visualbell
"set noerrorbells
set report=0

set textwidth=0
set pastetoggle=<F2>  " Fixes code pasting and stupid indents


"------Visuals------"

set t_CO=256
try
    colorscheme atom-dark-256
catch
    colorscheme desert
endtry

"set guifont=Liberation_Mono_for_Powerline:h10
"set guifont=Fira_Mono_for_Powerline:h10

"------Searching------"

set incsearch          " incremental search
set hlsearch           " highlight all matches
set ignorecase         " ignore case on search
set showmatch
set laststatus=2       " always status bar
set ruler
set backspace=2
set equalalways         " always split equal size

set wildignore=*.o,*.obj,*.bak,*.sw*,*.pyc
let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'


"------Key Mappings------"

let mapleader=','            " Default leader is \, but , is better

" Smart <Home>  -  First non-blank char on line
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

imap jk <Esc>
" Classic style savingss
nmap <C-s> :w<cr>
" Un-highlight searches
nmap <Leader><space> :nohlsearch<cr>
" Paste from buffer
nmap <Leader>p "+p
" Yank to EoL
nnoremap Y y$
" quick edit config files
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>ep :e $HOME/.vim/plugins.vim<cr>
nmap <Leader>ez :e $HOME/.zshrc<cr>
nmap <Leader><Tab> :NERDTreeToggle<cr>

" save as sudo if read-only
noremap <leader>W  :w !sudo tee %<CR>
command! W w

" buffers
nmap <Leader>t :enew<cr>           " New buffer
nmap <Leader>q :bp <BAR> bd #<CR>  " Close buffer
nnoremap <C-Right> :bn<CR>         " Next buffer
nnoremap <C-Left> :bp<CR>          " Prev buffer

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nmap <Leader>s :split<cr>
nmap <Leader>v :vsplit<cr>

nmap <silent> <A-Left> <C-w><
nmap <silent> <A-Down> <C-w>-
nmap <silent> <A-Up> <C-W>+
nmap <silent> <A-Right> <C-w>>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" navigation
nmap <C-Up> 5k
nmap <C-Down> 5j

" Easymotion
nmap s <Plug>(easymotion-overwin-f)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

"------Status Line------"

"set statusline=%F%m%r%h%w\ %=%y\ %l\/%L\ \ %p%%

set statusline=                                     " Override default
" set statusline+=%1*%{fugitive#statusline()[4:-2]}%* " Show fugitive git info
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total
set statusline+=%5*\ %*                             " Set ending space

set shm=atI                                         " Cut long messages

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=10


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
autocmd BufWritePre *.py :%s/\s\+$//e
