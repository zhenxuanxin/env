" Vundle
set nocompatible              " Be iMproved, required
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'valloric/youcompleteme', {'do': 'git submodule update --init --recursive'}
Plugin 'rizzatti/dash.vim'
Plugin 'universal-ctags/ctags'
Plugin 'taglist.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" See :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Plugin
autocmd StdinReadPre * let s:std_in=1
"NERDTree {
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
"}

"taglist {
let Tlist_Show_One_File = 1      " Only show current file's taglist, default is all
let Tlist_Exit_OnlyWindow = 1    " Exit vim when only taglist window
let Tlist_Use_Right_Window = 0   " Show taglist window on right side
let Tlist_GainFocus_On_ToggleOpen = 1 " Let gain focus on taglist window
"let Tlist_Ctags_Cmd =  '/usr/local/bin/ctags' " Set ctags command location
nnoremap <leader>tl :Tlist<CR>   " Set shortcut of Tlit
"}

" System
set clipboard=unnamed

" Colors
colorscheme desert
syntax enable       " Enable syntax processing

" Spaces & Tabs
set tabstop=4       " Number of visual spaces per TAB
set softtabstop=4   " Number of spaces in tab when editing
set expandtab       " Tabs are spaces

" UI Config
set number          " Show line numbers
set showcmd         " Show command in bottom bar
set cursorline      " Highlight current line
set guifont=Ubuntu\ Mono:h16
filetype indent on  " Load filetype-specific indent files
set wildmenu        " Visual autocomplete for command menu
set lazyredraw      " Redraw only when we need to
set showmatch       " Highlight matching [{()}]
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gb2312,gbk,big5,cp936,latin1
"set encoding=utf-8
"set termencoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Searching
set incsearch       " Search as characters are entered
set hlsearch        " Highlight matches

" Folding
set foldenable          " Enable folding
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " Fold based on indent level

" WhiteSpace
set listchars=tab:->,trail:>,eol:$
set list

" Space open/closes folds
nnoremap <space> za

" Movement
" Move vertically by visual line
"nnoremap j gj
"nnoremap k gk
" Move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>
" Highlight last inserted text
nnoremap gV `[v`]

" Leader Shortcuts
let mapleader=","   " leader is comma
" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" Edit/load vimrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Save session
nnoremap <leader>s :mksession<CR>
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 
" Auto copy backup to origin file
au FileType crontab setlocal bkc=yes
