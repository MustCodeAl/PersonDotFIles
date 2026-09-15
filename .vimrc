" ====================================================================
" 1. RECOMMENDED GENERAL VIM SETTINGS
" ====================================================================

"" --- General Settings & Behavior ---
set nocompatible        " Use Vim defaults instead of old Vi behavior
set encoding=utf-8      " Set standard text encoding to UTF-8
set mouse=a             " Enable mouse support for scrolling and clicking
set clipboard=unnamedplus " Use system clipboard (copy/paste outside Vim)
set history=1000        " Remember up to 1000 history items
set undofile            " Maintain undo history even after closing files
set backspace=indent,eol,start " Allow backspacing over everything in insert mode

"" --- Interface & Visuals ---
set number              " Show absolute line number on the current line
set relativenumber      " Show relative line numbers on all other lines
set numberwidth=2       " Keep the number column as skinny as possible
set signcolumn=number   " Overlay Signify/LSP signs directly onto numbers
set showcmd             " Display incomplete commands in the status bar
set ruler               " Always show current cursor position (row, col)
set t_Co=256            " Enable 256-color support for themes
syntax on               " Turn syntax highlighting on explicitly

" --- Environment-Aware Tuning (M1 Local vs. Warp SSH) ---
if has_key(environ(), "SSH_CLIENT") || has_key(environ(), "SSH_TTY")
    " On a remote SSH link: disable heavy rendering to prevent typing lag
    set nocursorline
    set lazyredraw
else
    " On your local M1 Mac: enjoy lightning-fast native terminal rendering
    set cursorline
    set nolazyredraw
endif

"" --- Tabs, Indentation & Layout ---
set expandtab           " Convert typed tabs into spaces
set tabstop=4           " Number of spaces a <Tab> counts for
set shiftwidth=4        " Number of spaces used for auto-indents
set autoindent          " Copy indent from current line when hitting enter
set smartindent         " Make auto-indentation layout smarter based on syntax
set wrap                " Turn on soft wrapping for long text lines

"" --- Searching ---
set hlsearch            " Highlight matches when searching text
set incsearch           " Show matches dynamically as you type a query
set ignorecase          " Make search case-insensitive...
set smartcase           " ...unless your query includes a capital letter
set gdefault            " Apply substitutions globally across a line by default

"" --- Backup & Swap Safety ---
set backup              " Enable safety backups
set writebackup         " Protect against crashes during writing
set swapfile            " Protect against simultaneous file editing

" Create dedicated folders for Vim clutter so your code stays clean
if !isdirectory($HOME . '/.vim/backups')
    call mkdir($HOME . '/.vim/backups', 'p')
endif
if !isdirectory($HOME . '/.vim/swaps')
    call mkdir($HOME . '/.vim/swaps', 'p')
endif
if !isdirectory($HOME . '/.vim/undo')
    call mkdir($HOME . '/.vim/undo', 'p')
endif

set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//
set undodir=~/.vim/undo//

"" --- Useful Quality-of-Life Mappings ---
let mapleader = " "

" Pressing Space + h turns off the distracting search highlights
nnoremap <leader>h :nohlsearch<CR>

" Easily navigate split windows using Control + Arrow Keys
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l


" ====================================================================
" 2. VIM-PLUG BLOCK (CLEANED & OPTIMIZED)
" ====================================================================

call plug#begin('~/.vim/plugged')

" --- Core Utilities & Language Tools ---
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

" --- Essential Aesthetics & Editing Extensions ---
Plug 'vim-airline/vim-airline'           " Clean statusline at bottom
Plug 'vim-airline/vim-airline-themes'    " Statusline color presets
Plug 'tpope/vim-commentary'              " Context-aware comment hotkeys (gcc)
Plug 'jiangmiao/auto-pairs'              " Smart auto-brackets/quotes closure
Plug 'dracula/vim', { 'as': 'dracula' }  " Professional aesthetic theme color palette

" --- Remote SSH & Local Performance Additions ---
Plug 'christoomey/vim-tmux-navigator'     " Smooth split management
Plug 'mhinz/vim-signify'                 " Asynchronous fast Git status margins
Plug 'mhinz/vim-startify'                " Start screen panel for fast remote session recall
Plug 'junegunn/fzf.vim'                  " Extension mappings block for full FZF utility

" --- Power-User Utility Additions ---
Plug 'tpope/vim-surround'                " Intuitively manage wrapping quotes/parentheses/tags
Plug 'tpope/vim-repeat'                  " Allow the dot (.) command to repeat plugin tasks
Plug 'mbbill/undotree'                   " Chronological branch-tree layout visualizer for undoing

call plug#end()


" ====================================================================
" 3. PLUGIN CONFIGURATIONS & KEYMAPS
" ====================================================================

"" --- Theme Palette Settings ---
colorscheme dracula                      " Load Dracula theme coloring
set t_ut=                                " Fix background coloring bugs over SSH/Warp

"" --- Vim-Easy-Align Mappings ---
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" --- NERDTree Configuration ---
" Toggle NERDTree sidebar quickly by pressing Space + n
nnoremap <leader>n :NERDTreeToggle<CR>
" Close Vim completely if the only window left open is NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"" --- FZF (Fuzzy Finder) Configuration ---
" Press Space + f to fuzzy search files instantly in your directory
nnoremap <leader>f :Files<CR>
" Press Space + b to search across your open buffers/tabs
nnoremap <leader>b :Buffers<CR>
" Press Space + g to fuzzy search text within your files (Requires ripgrep installed on machine)
nnoremap <leader>g :Rg<CR>

"" --- UndoTree Configuration ---
" Press Space + u to toggle the visual branching timeline of historical changes
nnoremap <leader>u :UndotreeToggle<CR>

"" --- Vim-Airline Settings ---
let g:airline_powerline_fonts = 1        
let g:airline_theme = 'dracula'          
let g:airline#extensions#tabline#enabled = 1 

"" --- Signify (Git Status) Settings ---
set updatetime=100                       " Fast sign column refresh interval

"" --- Rainbow Parentheses Automation ---
let g:rainbow_active = 1 

"" --- Startify Greeting Settings ---
let g:startify_session_persistence = 1   

"" --- LSP Configuration ---
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
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
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
" 4. SKINNY CURSOR & INPUT TUNING (CROSS-PLATFORM SAFE)
" ====================================================================

" Force xterm compatibility overrides for cursor handling (Warp + Terminal App Safe)
let &t_SI = "\<Esc>[5 q"  " Insert Mode -> Skinny Line
let &t_EI = "\<Esc>[2 q"  " Normal Mode -> Solid Block

" Clear lag delays when hitting Escape over network lines
set ttimeout
set ttimeoutlen=1
set ttyfast

" Safe bracketed paste mode toggles for external snippet pasting
if &term =~ "xterm"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    let &t_PS = "\e[200~"
    let &t_PE = "\e[201~"
endif
