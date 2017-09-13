runtime! archlinux.vim		        " Load global archlinux vimrc

filetype plugin indent on

if has("syntax")		            " Enables code syntax highlighting
  syntax on
endif

colorscheme elflord		            " Set theme
set showcmd			                " Show (partial) command in status line.
set showmatch			            " Show matching brackets.
set ignorecase			            " Do case insensitive matching
set smartcase			            " Do smart case matching
set incsearch			            " Incremental search
set autowrite			            " Automatically save before commands like :next and :make
set hidden			                " Hide buffers when they are abandoned
set nu				                " Enable linenumbers
"set mouse=a			                " Enable mouse usage (all modes)
set tabstop=4			            " show existing tab with 4 spaces width			
set shiftwidth=4		            " when indenting with '>', use 4 spaces width
set expandtab			            " show existing tab with 4 spaces width
set clipboard=unnamedplus           " yank to CLIPBOARD
au BufRead /tmp/mutt-* set tw=72     "max 72 char lenght when writing email
