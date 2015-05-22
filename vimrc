set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


"Plugin 'davidhalter/jedi-vim' " jedi autocompletion library (Python!)
Plugin 'scrooloose/nerdtree' " NERD Tree
Plugin 'kien/ctrlp.vim' " CtrlP (fuzzy search)
Plugin 'tpope/vim-commentary' " gc for commenting
Plugin 'rust-lang/rust.vim' " Rust
"Plugin 'klen/python-mode' " Python mode
"Plugin 'vim-scripts/Mark--Karkat' " Allows marking words multiple times
Plugin 'Valloric/YouCompleteMe' " YCM
Plugin 'Mark'
"Plugin 'tpope/vim-surround' 
"Plugin 'tpope/vim-ragtag'
"Plugin 'pangloss/vim-javascript'
"Plugin 'suan/vim-instant-markdown'
Plugin 'szw/vim-ctrlspace'
"Plugin 'ryanss/vim-hackernews'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Basics
set autoindent smartindent backspace=2 encoding=utf-8 hlsearch incsearch
set nobackup nocompatible noswapfile number shiftwidth=4
set smarttab tabstop=4 expandtab
set expandtab
syntax on

" 256 colours terminal support
set t_Co=256

" vim -p limit
set tabpagemax=100

" Colors
colorscheme molokai
hi Comment ctermfg=200	" Highlighting comments

" Gui options
if has("gui_running")
  hi Comment guifg=#FF00FF
  set gfn=Inconsolata\ Medium\ 10
  set guioptions=-t
  set lines=48
  set columns=100
endif

" Persistent undo
if has('persistent_undo')
    set undodir=~/.vim-backups
    set undofile
endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" If a window is being splitted (for example, for jedi to display a
" docstring), make it appear below or on the right
set splitbelow
set splitright


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

if has('mouse')
  set mouse=a
  set mousehide
endif

" Allow buffer switching without saving
set hidden

" Highlight curent line
set cursorline

"easier window navigation
nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <S-Tab> :wincmd W<CR>

" Inserting and copying to clipboard
map <leader>c "+y
map <leader>v "+gp
map <leader>a ggVG

" Wrapped lines goes down/up to next row, rather than next line in file
noremap j gj
noremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2

" Plugins
" NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']

" Python mode
let g:pymode_rope = 0 " Disable rope autocompletion (use jedi instead)
let g:pymode_folding = 0 " Don't fold definitions, classes etc
let g:pymode_virtualenv = 1

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" YouCompleteMe
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf = "/home/kele/.vim/ycm_global_conf.py"

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Ctrlspace
let g:ctrlspace_set_default_mapping = 1
let g:ctrlspace_default_mapping_key = "<C-a>"

set clipboard=unnamedplus

au BufRead,BufNewFile *.rs map <leader>b :!cargo build<CR>
au BufRead,BufNewFile *.rs map <leader>r :!cargo run<CR>
