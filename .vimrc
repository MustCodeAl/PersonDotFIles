" ====================================================================
" 1. GENERAL VIM SETTINGS & MAXIMUM PERFORMANCE TUNING
" ====================================================================
set nocompatible
filetype off
set encoding=utf-8
syntax on

set mouse=a
set clipboard=unnamedplus
set history=1000
set undofile

set backspace=indent,eol,start
set number
set relativenumber
set numberwidth=2
set signcolumn=number
set showcmd
set ruler
set t_Co=256

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

set wrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

set backup
set writebackup
set swapfile
set ttyfast
set updatetime=250
set synmaxcol=250
set scrolljump=5

" --- Performance Overrides (Warp SSH vs Local Mac) ---
if has_key(environ(), "SSH_CLIENT") || has_key(environ(), "SSH_TTY")
    set nocursorline
    set lazyredraw
    syntax sync minlines=128
else
    set cursorline
    set nolazyredraw
    syntax sync minlines=256
endif

let mapleader = " "
nnoremap <leader>h :nohlsearch<CR>
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

if !isdirectory($HOME.'/.vim/backups') | call mkdir($HOME.'/.vim/backups', 'p') | endif
if !isdirectory($HOME.'/.vim/swaps')   | call mkdir($HOME.'/.vim/swaps', 'p')   | endif
if !isdirectory($HOME.'/.vim/undo')    | call mkdir($HOME.'/.vim/undo', 'p')    | endif

set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//
set undodir=~/.vim/undo//

" ====================================================================
" 2. VIM-PLUG DECLARATION BLOCK
" ====================================================================
call plug#begin('~/.vim/plugged')

" --- Core Tools & Language Layout Packs ---
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'luochen1990/rainbow'
Plug 'ntnn/vim-ctagser'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-sensible' 
Plug 'sheerun/vim-polyglot'

" --- Layout Aesthetics & Editing Support ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula' }

" --- Environments & Navigation Utilities ---
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'liuchengxu/vista.vim'
Plug 'Yggdroot/indentLine'

" --- Collaborative Systems & Quality of Life Tools ---
Plug 'tpope/vim-fugitive'
Plug 'simnalhe/git-blame.nvim'
Plug 'mhinz/vim-crates', { 'for': 'toml' }

call plug#end()

" ====================================================================
" 3. PLUGIN ENGINE SPECIFIC CONFIGURATIONS
" ====================================================================
colorscheme dracula
set t_ut=

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>n :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
let $FZF_DEFAULT_COMMAND = 'find . -type f -not -path "*/.git/*" -not -path "*/node_modules/*" -not -path "*/target/*" -not -path "*/.cache/*"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>v :Vista!!<CR>

let g:vista_default_executive = 'vim_lsp'
let g:vista_sidebar_width = 30

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

autocmd BufRead,BufNewFile Cargo.toml call crates#toggle()

let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1
let g:startify_session_persistence = 1

let g:lsp_diagnostics_enabled = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim/lsp.log')

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g = <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ====================================================================
" 4. CURSOR TRANSLATIONS & ESCAPE OVERRIDES
" ====================================================================
let &t_SI = "\<Esc>[5 q"
let &t_EI = "\<Esc>[2 q"
set ttimeout
set ttimeoutlen=1

if &term =~ "xterm"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    let &t_PS = "\e[200~"
    let &t_PE = "\e[201~"
endif
