:set t_Co=256
:set showmatch " show matching brackets
:set nohlsearch " do not highlight searched for phrases
:set incsearch " BUT do highlight as you type you search phrase
:set noerrorbells " no noises
:set vb t_vb=
:set paste

:set smartindent
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set ruler " show column & cursor position
set foldmethod=indent
set foldnestmax=2
nnoremap <F2> zA
nnoremap <space> za

:colorscheme winternight
:syntax on 

filetype plugin indent on

au FileType puppet setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
