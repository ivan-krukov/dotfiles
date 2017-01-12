" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged/')

" Editing {{{
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'haya14busa/incsearch.vim'
" }}}

" Completion {{{
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'SirVer/ultisnips'
" }}}

" Syntax {{{
Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
" }}}

" UI {{{
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'yggdroot/indentline'
" }}}

" Other {{{
Plug 'christoomey/vim-tmux-navigator' 
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
"Plug 'wilywampa/vim-ipython'
Plug 'bfredl/nvim-ipy'
" }}}

call plug#end()
" }}}

" Basic settings {{{
" no vi, only vim
set nocompatible
filetype indent plugin on
" syntax highlighting
syntax on
" allow editing mulitple unsaved files
set hidden
" Don't move cursor to start of line after multi-line jumps
set nostartofline
" }}}

" Search {{{
" Case insenstivity
set ignorecase
" Case sensitivity when using caps
set smartcase
" }}}

" Indentation {{{
" keep indentation
set autoindent
" Backspace over indent, end of line, start of insert
set backspace=indent,eol,start
" 4-space soft tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
" File-specific
augroup filetype_indent
    autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
augroup END
" }}}

" Terminal UI {{{
" Show me as I type
set showcmd
" Show cursor location
set ruler
" Show line numbers
set number
" 2 line status area
set cmdheight=2
" Always a status line for last window
set laststatus=2
" Ask if trying to close edited file
set confirm
" Smaller timeout for commands
set timeout timeoutlen=1000 ttimeoutlen=0
" Do not expand comments to next line
set formatoptions-=r " On enter
set formatoptions-=o " On 'o'
" tab completion for menu items
set wildmenu
" color
colorscheme gruvbox
set background=dark
" be lazy
set lazyredraw
" Folding
set foldmethod=marker
" }}}

" Key mappings {{{
"
" Core mappings
let mapleader = "\<Space>"
let localleader = ","
set mouse=a

" Movement
" H to go to beginning of line
xnoremap H ^
" L to go to end of line
xnoremap L $
" No join
xnoremap J j
" No doc lookup
xnoremap K k
" move vertically by visual line
nnoremap j gj
nnoremap k gk

"Leader
" Show whitespace
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
" Close buffer but not split
nnoremap <leader>z :bp\|bd #<CR>

" Misc settings
" Sourcing vimrc
nnoremap <leader>ve :split $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
" }}}

" Plugin settings

" Deoplete {{{
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1

"" Only complete when tab is pressed
"inoremap <silent><expr> <TAB>
            "\ pumvisible() ? "\<C-n>" :
            "\ <SID>check_back_space() ? "\<TAB>" :
            "\ deoplete#mappings#manual_complete()
"function! s:check_back_space() abort
    "let col = col('.') - 1
    "return !col || getline('.')[col - 1]  =~ '\s'
"endfunction

"" Python Completion
"let g:deoplete#sources#jedi#show_docstring = 1
" }}}

" Pandoc {{{
" For markdown files
augroup pandoc_syntax
    autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
" Don't use conceal feature
let g:pandoc#syntax#conceal#use = 0
" Automatically color following code blocks
let g:pandoc#syntax#codeblocks#embeds#langs = ['python', 'c', 'bash=sh', 'tex']
" }}}

" Ultisnips {{{
noremap <C-e> <nop>
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>n"
let g:UltiSnipsJumpBackwardTrigger="<C-e>N"
" }}}

" vim-tmux-navigator {{{
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
inoremap <C-h> <Esc>:TmuxNavigateLeft<CR>
inoremap <C-j> <Esc>:TmuxNavigateDown<CR>
inoremap <C-k> <Esc>:TmuxNavigateUp<CR>
inoremap <C-l> <Esc>:TmuxNavigateRight<CR>
inoremap <C-\> <Esc>:TmuxNavigatePrevious<CR>
" }}}

" FZF {{{
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Ag<CR>
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
function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf ctermfg=white ctermbg=black
    setlocal statusline=%#fzf1#\ >\ fzf
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" }}}

" Slime {{{
" Tmux is default multiplexer
let g:slime_target = "tmux"
" Do not apply default mappings
let g:slime_no_mappings = 1
" Use default socket, current session, current window, pane #2
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
" Don't ask anything on startup
let g:slime_dont_ask_default = 1
" Use `cpaste` for `ipython` with `.py` files
let g:slime_python_ipython = 1

" Keybindings

" Visual mode leader+r to send current selection
vmap <leader>r <Plug>SlimeRegionSend
" Normal mode leader+r to send current line
nmap <leader>r V<Plug>SlimeRegionSend
" Normal mode leader+shift+r to send current function (requires vim-textobj-python)
autocmd FileType Python nmap <leader>R vaf<Plug>SlimeRegionSend
" }}}

" Neomake {{{
" make on save
"autocmd! BufReadPost,BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['pylint']
" Open error list
nnoremap <leader>w :lopen<CR>
" Signs
let g:neomake_error_sign = { 'text': '✕'}
let g:neomake_warning_sign = { 'text': '◼︎' }
let g:neomake_info_sign = { 'text': '𝐢'} 
let g:neomake_message_sign = { 'text': '▶︎' }
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
let g:airline#extensions#tabline#enabled = 1
" }}}

" Gitgutter {{{
let g:gitgutter_sign_column_always = 1
" }}}

" YouCompleteMe {{{
" Do not pop-up documentation while autocompleting
set shortmess+=c
set completeopt="menuone"
"let g:ycm_auto_trigger = 0
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir = 1
" Don't show diagnostics - neomake already does
let g:ycm_show_diagnostics_ui = 0
" Keymaps
"nnoremap <leader>g :YcmCompleter GoTo<CR>
"nnoremap <leader>d :YcmCompleter GetDoc<CR>
" }}}

" Indentline {{{
let g:indentLine_fileTypeExclude = ['help']
" }}}

" Vim-ipython {{{
map  <buffer> <silent> <Leader>s <Plug>(IPython-RunLine)
"imap <buffer> <silent> <C-s> <C-o><Plug>(IPython-RunLine)
" }}}

" Incsearch {{{
" Basic
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Clear highlights after search
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}
