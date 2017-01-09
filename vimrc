call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'haya14busa/incsearch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'jpalardy/vim-slime'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
call plug#end()


set nocompatible

filetype indent plugin on
syntax on

set hidden
set wildmenu

set showcmd

set hlsearch
set incsearch

set ignorecase
set smartcase

set timeout timeoutlen=3000 ttimeoutlen=100

set backspace=indent,eol,start
set autoindent

set nostartofline
set ruler
set laststatus=2

set confirm

set cmdheight=2

set number

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

let mapleader = "\<Space>"
let maplocalleader = ","
set mouse=a
set clipboard=unnamed

nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nnoremap <C-c> :bp\|bd #<CR>

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Ag<CR>

" Close other windows in one fell swoop
nnoremap <leader>z :only<CR>

nnoremap H ^
nnoremap L $
nnoremap J <nop>
nnoremap K <nop>

colorscheme solarized

"Ultisnips
noremap <C-e> <nop>
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>n"
let g:UltiSnipsJumpBackwardTrigger="<C-e>N"

"Incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'TabLine'],
            \ 'bg+':     ['bg', 'TabLine'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" YouCompleteMe settings
" Do not pop-up documentation while autocompleting
set shortmess+=c
set completeopt="menuone"
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>

"vimslime
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
xmap <leader>r <Plug>SlimeRegionSend

":autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw

