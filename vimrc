set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
"

Plugin 'Rip-Rip/clang_complete'

" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" Silver searcher
Plugin 'rking/ag.vim'

" Markdown support
Plugin 'tpope/vim-markdown'

" Python support
Plugin 'davidhalter/jedi-vim'

" NERD Tree (file explorer)
Plugin 'scrooloose/nerdtree' " NERD Tree

" Go support
Plugin 'fatih/vim-go' " Go support

" Highlight trailing whitespace
Plugin 'bronson/vim-trailing-whitespace'

" Colorscheme switching
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'flazz/vim-colorschemes'

" Seamless Vim/Tmux navigation
Plugin 'christoomey/vim-tmux-navigator'

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plugin 'dense-analysis/ale'

" Distraction free writing
Plugin 'junegunn/goyo.vim'

" Git gutter
Plugin 'airblade/vim-gitgutter'

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
" This is more or less copied from some place on the internet, I don't really
" remember from where. Although, I have adjusted it a bit to my taste. Don't
" ask how.
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

    " Pink comments (comments are important, don't overuse them)
    hi Comment ctermfg=200

    " Gui options
    if has("gui_running")
        " Pink comments (comments are important, don't overuse them)
        hi Comment guifg=#FF00FF

        set gfn=Inconsolata\ Medium\ 11
        set guioptions=-t
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

    " CtrlP
    let g:ctrlp_custom_ignore = {
        \ 'dir': '\v(CMakeFiles|build|bin)$',
        \ 'file': '\v\.pyc$'
        \ }
    let g:ctlp_max_files = 0
    let g:ctrlp_working_path_mode = 'ra'

" Filetype specific
    " C++
    au FileType cpp set tabstop=2 shiftwidth=2 expandtab foldmethod=indent

    " Go
    autocmd FileType go map <F8> :GoBuild<cr>

    " Python
    au FileType python set expandtab tabstop=2 shiftwidth=2 softtabstop=2 foldmethod=indent

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Colorscheme switching
    let g:colorscheme_switcher_define_mappings = 0

    noremap <F9> :PrevColorScheme<cr>
    noremap <F10> :NextColorScheme<cr>

set laststatus=2

set t_Co=256
let base16colorspace=256
