set nocompatible

filetype plugin on
filetype indent on
syntax on
au BufReadPost *.dust,*.taco,*.ejs set syntax=html
au BufReadPost *.md set syntax=markdown

set background=dark
set title
set number
set t_Co=256
set nowrap
set ruler

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
set re=2

set pastetoggle=<F2>
set paste

set mouse=a
set mousehide

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

colorscheme slate
set shiftwidth=2
set expandtab
set tabstop=2
set wrap

set noerrorbells
set visualbell
set t_vb=

map <S-Enter> O<Esc>j
map <CR> o<Esc>k

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufEnter * if &ruler == 0 | set ruler | endif

map <right> :tabnext<CR>
map <left> :tabprevious<CR>
inoremap <right> <ESC>:tabnext<CR>a
inoremap <left> <ESC>:tabprevious<CR>a
