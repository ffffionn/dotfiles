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
" show only filename
let g:airline#extensions#tabline#fnamemod = ':t'
