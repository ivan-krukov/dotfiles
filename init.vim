" vim:foldmethod=indent:foldnestmax=2:fo-=ro

" Plugins
    "
    call plug#begin('~/.local/share/nvim/plugged/')
    " Editing
        "
        Plug 'scrooloose/nerdcommenter'
        Plug 'tpope/vim-surround'
        Plug 'kana/vim-textobj-user'
        Plug 'bps/vim-textobj-python'

    " Completion
        "
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-jedi', { 'for': 'python' }
        Plug 'mattn/emmet-vim', { 'for': 'html' }
        Plug 'SirVer/ultisnips'

    " Syntax
        "
        Plug 'sheerun/vim-polyglot'
        Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }

    " Other
        "
        Plug 'christoomey/vim-tmux-navigator' 
        Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-gitgutter'
        Plug 'flazz/vim-colorschemes'
        Plug 'neomake/neomake'

    call plug#end()

" Basic settings
    "
    " no vi, only vim
    set nocompatible
    filetype indent plugin on
    " syntax highlighting
    syntax on
    " allow editing mulitple unsaved files
    set hidden
    " Don't move cursor to start of line after multi-line jumps
    set nostartofline

" Search
    "
    " Highlight search pattern
    set hlsearch
    " Incremental search
    set incsearch
    " Case insenstivity
    set ignorecase
    " Case sensitivity when using caps
    set smartcase

" Indentation
    "    
    " keep indentation
    set autoindent
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

" Terminal UI
    "
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
    colorscheme solarized
    " be lazy
    set lazyredraw

" Key mappings
    "
    " Core mappings
        "
        let mapleader = "\<Space>"
        let localleader = ","
        set mouse=a

    " Movement
        "
        " H to go to beginning of line
        xnoremap H ^
        " L to go to end of line
        xnoremap L $
        " No join
        nnoremap J <nop>
        " No doc lookup
        nnoremap K <nop>
        " move vertically by visual line
		nnoremap j gj
		nnoremap k gk

    "Leader
        "
        " Show whitespace
        nnoremap <leader>l :set list!<CR>
        set listchars=tab:▸\ ,eol:¬
        " Close other windows in one fell swoop
        nnoremap <leader>z :only<CR>
        " Close buffer but not split
        nnoremap <leader>x :bp\|bd #<CR>

" Misc settings
    "
    " Sourcing vimrc
    nnoremap <leader>ve :split $MYVIMRC<CR>
    nnoremap <leader>vs :source $MYVIMRC<CR>

" Plugin settings

" Deoplete
    "
    let g:deoplete#enable_at_startup = 1
    " Python Completion
    let g:deoplete#sources#jedi#show_docstring = 1

" Pandoc
    "
    " For markdown files
    augroup pandoc_syntax
        autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END
    " Don't use conceal feature
    let g:pandoc#syntax#conceal#use = 0
    " Automatically color following code blocks
    let g:pandoc#syntax#codeblocks#embeds#langs = ['python', 'c', 'bash=sh', 'tex']

" Ultisnips
    "
    noremap <C-e> <nop>
    let g:UltiSnipsExpandTrigger="<C-e>"
    let g:UltiSnipsJumpForwardTrigger="<C-e>n"
    let g:UltiSnipsJumpBackwardTrigger="<C-e>N"

" vim-tmux-navigator
    "
    inoremap <C-h> <Esc>:TmuxNavigateLeft<CR>
    inoremap <C-j> <Esc>:TmuxNavigateDown<CR>
    inoremap <C-k> <Esc>:TmuxNavigateUp<CR>
    inoremap <C-l> <Esc>:TmuxNavigateRight<CR>
    inoremap <C-\> <Esc>:TmuxNavigatePrevious<CR>

" FZF
    "
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

" Slime
    "
    """ Tmux is default multiplexer
    let g:slime_target = "tmux"
    """ Do not apply default mappings
    let g:slime_no_mappings = 1
    """ Use default socket, current session, current window, pane #2
    let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
    """ Don't ask anything on startup
    let g:slime_dont_ask_default = 1
    """ Use `cpaste` for `ipython` with `.py` files
    let g:slime_python_ipython = 1
