" Dein Plugin "{{{
" Required:
set runtimepath+=/home/robin/.nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/robin/.nvim')
  call dein#begin('/home/robin/.nvim')

  " Let dein manage dein
  " Required:
  call dein#add('/home/robin/.nvim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " Color schemes ---
  call dein#add('ayu-theme/ayu-vim')
  call dein#add('itchyny/lightline.vim')            " Lightline status bar
  " --- Color schemes

  " Shougo ---
  call dein#add('Shougo/neosnippet.vim')            " snippet manager
  call dein#add('Shougo/neosnippet-snippets')       " snippets
  call dein#add('Shougo/deoplete.nvim')             " auto completion
  call dein#add('Shougo/deol.nvim')                 " shell integration
  " --- Shougo

  " Snytax ---
  call dein#add('neomake/neomake')                  " syntastic replacement
  call dein#add('sheerun/vim-polyglot')             " adds more languages syntax
  " --- Snytax

  " Text manipulation ---
  call dein#add('tpope/vim-surround')               " change surrounding <blah>
  call dein#add('tpope/vim-commentary')             " comment out stuff 'gcc'
  call dein#add('tpope/vim-repeat')                 " repeat plugin features using '.'
  " --- Text manipulation

  " UI ---
  call dein#add('scrooloose/nerdtree')              " nerdtree
  call dein#add('ryanoasis/vim-devicons')           " icons in nerdtree
  " fuzzy finder
  call dein#add('junegunn/fzf', {
              \ 'rtp': '/home/robin/.nvim/repos/github.com/junegunn/fzf',
              \ 'build': './install --bin',
              \ })
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/goyo.vim')                " center focus text
  call dein#add('wsdjeg/dein-ui.vim')               " adds :DeinUpdate
  " auto completion
  call dein#add('autozimu/LanguageClient-neovim', {
              \ 'build': 'bash install.sh',
              \ })
  call dein#add('junegunn/limelight.vim')           " focused text
  " --- UI

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" }}}

" Colors "{{{
if has('termguicolors')
  set termguicolors                     " 24-bit terminal
endif

set background=dark                     " dark version of colorscheme
" let ayucolor="mirage"
let ayucolor="dark"
colorscheme ayu                         " set colorscheme
set visualbell                          " turns system bell from audio to visual
set t_vb=                               " something with bell
" }}}

set nocompatible                        " Be iMproved

" == Encodings == "
set encoding=utf-8                      " set vim encoding
set fileencoding=utf-8                  " set file encoding

" == UI Configs == "
set showcmd                             " show command in bottom bar
set number                              " show line number
set relativenumber                      " show relative line number
" set cursorline                          " highlight current line
filetype indent on                      " load filetype-specific indent files
set wildmenu                            " visual autocomplete for command menu
set showmatch                           " highlight matching [{()}]
set cmdheight=1                         " hight of command area
set ruler                               " shows cursor positon (bottom right)
set hidden                              " allows hiding of buffers that contain modifications
set laststatus=2                        " always show status line
set confirm                             " brings up "Do you want to save?" on quit
set wrap                                " wrap at end of screen
set linebreak                           " smart wrap, don't break words
set foldmethod=marker                   " enable folding using markers
set lazyredraw                          " fix buggy status line in tmux
" custom gui cursors
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" == Spaces & Tabs == "
set tabstop=4                           " number of visual spaces per TAB
set shiftwidth=4                        " same as tabstop but for >> & <<
set softtabstop=4                       " number of spaces in tab when editing
set expandtab                           " turns <tab> to spaces
set autoindent                          " figues out what indentation should be used
set backspace=indent,eol,start          " allow ^W accross lines in insert mode
set listchars=tab:▸\ ,eol:¬             " invis chars

" == Seaching == "
set incsearch                           " search as characters are entered
set hlsearch                            " highlight matches
set ignorecase                          " case insensitive searching

" == I/O == "
set mouse=a                             " enable mouse use in all modes
let mapleader = ","                     " set the leader key
set nostartofline                       " diable column change
set notimeout ttimeout ttimeoutlen=0    " wait for input
set langmenu=en_US.UTF-8                " set language
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//
set undofile                            " save undo's after file close

" == (Re)-maps == "
map <C-a> <esc>ggVG<CR>
nmap <leader>l :set list!<CR>
nmap <leader>t :NERDTreeToggle<CR>
vmap <C-K> <Esc>`<kdd`>pgv
vmap <C-J> <Esc>`>jdd`<Pgv
vmap > >gv
vmap < <gv
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
inoremap <C-o> <Esc>o
nnoremap <Esc> :nohl<CR>

" scroll through the file a little faster
nnoremap <C-Y> 3<C-Y>
vnoremap <C-Y> 3<C-Y>
inoremap <C-Y> <Esc>3<C-Y>a
nnoremap <C-E> 3<C-E>
vnoremap <C-E> 3<C-E>
inoremap <C-E> <Esc>3<C-E>a

" == AutoCMDs == "
autocmd BufWritePre * if &ft!="markdown"|:%s/\s\+$//e|endif      " remove whitespaces @ end of line unless you're writing markdown
augroup gitcommit
    autocmd!
    autocmd filetype gitcommit call setpos('.', [0, 1, 1, 0])
    autocmd filetype gitcommit set spell
augroup END

" == Plugins == "
" deoplete
let g:deoplete#enable_at_startup = 1    " enable deoplete by default
" lightline
let g:lightline = {
  \ 'colorscheme': 'deus',
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
  \ }
" fzf
nnoremap <C-P> :FZF<CR>
" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'go': ['gopls'],
    \ 'rust': ['rls'],
    \ }
" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
