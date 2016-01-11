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

Plugin 'klen/python-mode' " Python mode
Plugin 'scrooloose/nerdtree' " NERD Tree

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Basics
    set autoindent smartindent backspace=2 encoding=utf-8 hlsearch incsearch
    set nobackup nocompatible noswapfile number shiftwidth=4
    set smarttab tabstop=4 expandtab
    set expandtab
    syntax on


" Appearance
    " 256 colours terminal support
    set t_Co=256
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

    " Highlight current line
    set cursorline

    " Show matching brackets when text indicator is over them
    set showmatch
    " How many tenths of a second to blink when matching brackets
    set mat=2


" Bindings
    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader = ","
    let g:mapleader = ","

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>

    if has('mouse')
      set mouse=a
      set mousehide
    endif

    " Wrapped lines goes down/up to next row, rather than next line in file
    noremap j gj
    noremap k gk

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>


" Search
    " Highlight search results
    set hlsearch

    " Makes search act like search in modern browsers
    set incsearch

" Misc
    " Persistent undo
    if has('persistent_undo')
        set undodir=~/.vim-backups
        set undofile
    endif

    " vim -p limit
    set tabpagemax=100

    " Don't redraw while executing macros (good performance config)
    set lazyredraw

    " If a window is being splitted (for example, for jedi to display a
    " docstring), make it appear below or on the right
    set splitbelow
    set splitright


    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    " Allow buffer switching without saving
    set hidden

    " Clipboard shared with the rest of the OS
    set clipboard=unnamedplus


" Plugins
    " NERDTree
    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '__pycache__']

    " Python mode
    "let g:pymode_rope = 0 " Disable rope autocompletion (use jedi instead)
    let g:pymode_folding = 0 " Don't fold definitions, classes etc
    let g:pymode_lint_checkers = ['pep8']
    let g:pymode_virtualenv = 1
    let g:pymode_rope = 1
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_options_max_line_length = 100


" Filetype specific
    " Rust stuff
    au BufRead,BufNewFile *.rs map <leader>b :!cargo build<CR>
    au BufRead,BufNewFile *.rs map <leader>r :!cargo run<CR>

    " SML
    au FileType sml setlocal makeprg=rlwrap\ sml\ '%'
    au FileType sml set tabstop=4 shiftwidth=4 expandtab foldmethod=indent

    " OCaml
    au FileType ocaml set tabstop=2 shiftwidth=2 expandtab foldmethod=indent

    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"

    " Haskell
    au FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
