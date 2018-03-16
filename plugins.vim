"------PLUGINS------"
filetype off                " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

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
