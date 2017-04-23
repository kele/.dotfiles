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
"

Plugin 'Shougo/neocomplete.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-markdown'

Plugin 'klen/python-mode' " Python mode
Plugin 'scrooloose/nerdtree' " NERD Tree

Plugin 'fatih/vim-go' " Go support

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Bindings
    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader = ","
    let g:mapleader = ","

    let maplocalleader = "\\"
    let g:maplocalleader = "\\"

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


" Basics
    set autoindent smartindent backspace=2 encoding=utf-8 hlsearch incsearch
    set nobackup nocompatible noswapfile number shiftwidth=4
    set smarttab tabstop=4 expandtab
    set expandtab
    syntax on

" Reasonable completion
  set completeopt=longest,menuone

  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
    \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

  inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
    \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

  function CleverCompletion()
    if &omnifunc != ''
        return 2
    elseif &completefunc != ''
        return 1
    else
        return 0
    endif
  endfunction

  " open omni completion menu closing previous if open and opening new menu without changing the text
  inoremap <expr> <C-Space>
    \ (pumvisible() ?
    \   (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i')
    \ : '') .
    \ (CleverCompletion() == 2 ?
    \   '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
    \ : (CleverCompletion() == 1 ?
    \       '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
    \     : '<C-n><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'))

  inoremap <C-@> <C-x><C-o>


" Appearance
    " 256 colours terminal support
    set t_Co=256
    colorscheme monokain
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
    let g:pymode_lint_checkers = []
    let g:pymode_virtualenv = 1
    let g:pymode_rope = 1
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_options_max_line_length = 100

    " CtrlP
    let g:ctrlp_custom_ignore = {
        \ 'dir': '\v(CMakeFiles|_build|bin)$',
        \ 'file': '\v\.pyc$'
        \ }
    let g:ctlp_max_files = 0
    let g:ctrlp_working_path_mode = 'ra'


" Filetype specific
    " Rust stuff
    au BufRead,BufNewFile *.rs map <leader>b :!cargo build<CR>
    au BufRead,BufNewFile *.rs map <leader>r :!cargo run<CR>

    " SML
    au FileType sml setlocal makeprg=rlwrap\ sml\ '%'
    au FileType sml set tabstop=4 shiftwidth=4 expandtab foldmethod=indent

    " C++
    au FileType cpp set tabstop=4 shiftwidth=4 expandtab foldmethod=indent

    " OCaml
    au FileType ocaml set tabstop=2 shiftwidth=2 expandtab foldmethod=indent
    au FileType ocaml noremap <localleader>d <Esc>:MerlinLocate<CR>

    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"

    " Haskell
    au FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2

" neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#auto_completion_start_length = 10

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = { 'default' : ''}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

autocmd FileType go map <F8> :GoBuild<cr>

let g:colorscheme_switcher_define_mappings = 0

noremap <F11> :PrevColorScheme<cr>
noremap <F12> :NextColorScheme<cr>
