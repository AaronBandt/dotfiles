set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

:let mapleader=","
set relativenumber
set number
" :set mouse=a
" :set clipboard=unnamed

" - syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>
nnoremap <Leader>n  :lne<CR>
nnoremap <Leader>p  :lp<CR>

" - YouCompleteMe

let g:ycm_autoclose_preview_window_after_completion=1

" go to the def of selected funtion
map <Leader>g  :YcmCompleter GoTo<CR>

" - ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

:set t_Co=256
:set showmatch " show matching brackets
:set nohlsearch " do not highlight searched for phrases
:set incsearch " BUT do highlight as you type you search phrase
:set noerrorbells " no noises
:set vb t_vb=
:set smartindent
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set ruler " show column & cursor position
set encoding=utf-8
set foldmethod=indent
set foldnestmax=2

" Toggle paste
:set pastetoggle=<F10>

set number
nnoremap <F9> :set nonumber!<CR> :set norelativenumber! <CR>

nnoremap <F2> zA
nnoremap <space> za

:colorscheme winternight
:syntax on 

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
au FileType javascript, html, css setlocal tabstop=2 softtabstop=2 shiftwidth=2
au FileType puppet setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

