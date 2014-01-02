set formatoptions-=cro
set nocompatible

filetype plugin on
filetype indent on
syntax on

set background=dark
set title
set number
set t_Co=256
set nowrap

set autoindent
set smartindent
set smarttab
set cindent

set bs=2
set et
set sts=4

set showmatch
set hlsearch
set ignorecase
set incsearch
set smartcase

set pastetoggle=<F2>

set mouse=a
set mousehide

"backup
set backup
if has("unix")
   if !isdirectory(expand("~/.vim/backups/."))
      !mkdir -p ~/.vim/backups/.
   endif
   if !isdirectory(expand("~/.vim/swaps/."))
      !mkdir -p ~/.vim/swaps/.
   endif
endif

set directory=~/.vim/swaps
set backupdir=~/.vim/backups

map <silent> <F2> :Flisttoggle<CR>

"basic
colorscheme slate
set number
set shiftwidth=3
set expandtab
set tabstop=3
set wrap

"newlines from escaped mode
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <right> :tabnext<CR>
map <left> :tabprevious<CR>
inoremap <right> <ESC>:tabnext<CR>a
inoremap <left> <ESC>:tabprevious<CR>a
"map <c-t> :wq<CR>
