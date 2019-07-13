set nocompatible
filetype off

if empty(glob(
    \ '$HOME/' . (has('win32') ? 'vimfiles' : '.vim') . '/autoload/plug.vim'))
  execute '!curl -fLo ' .
    \ (has('win32') ? '\%USERPROFILE\%/vimfiles' : '$HOME/.vim') . 
    \ '/autoload/plug.vim --create-dirs ' .
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"Plug 'raimondi/delimitmate'
Plug 'jrozner/vim-antlr'
Plug 'lilyball/vim-swift'
Plug 'peterhoeg/vim-qml'
call plug#end()

let mapleader = ";"

filetype plugin indent on
set shortmess+=I
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
inoremap jj <ESC>
inoremap <leader>a ä
inoremap <leader>A Ä
inoremap <leader>o ö
inoremap <leader>O Ö
inoremap <leader>u ü
inoremap <leader>U Ü
inoremap <leader>s ß
set showcmd
set tabstop=2
set shiftwidth=2
syntax on
set encoding=utf-8
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
"set list
set listchars=tab:▸\ ,eol:¬
set wrap
set textwidth=100
set formatoptions=qrn1

"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
"set showmatch
set matchtime=0
set hlsearch
nnoremap <tab> %
vnoremap <tab> %
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set clipboard=unnamed
let delimitMate_expand_cr=1
set nobackup       
set nowritebackup  
set noswapfile     
set noundofile
set background=light
autocmd BufNewFile,BufReadPost *.sc set filetype=scala
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
set number
autocmd Filetype text setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 
autocmd Filetype tex setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 
" Don't show ~ on for lines not in Buffer
highlight EndOfBuffer ctermfg=white ctermbg=white guifg=white
let delimitMate_quotes = "\" ' "

map <leader>v :CtrlPTag<CR>

set wildignore+=*.dylib,*.so,*.swp,*.zip
if executable("ag")
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ -g ""'
endif


if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
