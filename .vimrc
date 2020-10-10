" Section Miscellaneous Setting {{{

" Enable syntax
syntax enable

" Setup the generic color scheme
" colorscheme desert
colorscheme apprentice
set number

" The encoding displayed.
set encoding=utf-8

" The encoding written to file.
set fileencoding=utf-8

" Fix backspace issue on Vim 7.4
set backspace=indent,eol,start

" Display incomplete command
set showcmd

"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:∘

" Show current mode
set showmode

" Tell VIM to always put a status line in, event if there is only one window
set laststatus=2

" Keep some stuff in the history
set history=100

" Open new split panes to right and button
set splitbelow
set splitright

set foldmethod=marker
set foldlevel=0
set modelines=1

set lcs+=space:·

" set to auto read when a file is changed from the outside
set autoread

" Alway show the current cursor position
set ruler
hi CursorLine term=bold cterm=bold guibg=Grey40

" Make command line two lines high
set ch=2

" Enable filetype plugins
filetype plugin on
filetype indent on

"--------------------------------------------------------------------
" Searching
"--------------------------------------------------------------------
set showmatch
set incsearch       " Incremental searching
set hlsearch        " Highlight matches
set ignorecase      " Searches are case insensitive
set smartcase       " Unless they contain at least on capital letter
set wrapscan        " Set the search can to wrap lines

" }}}
" Section Indentation setting {{{
set expandtab        " Insert space characters whenever the tab key is pressed
retab                " Change all the existing tab characters to match the current tab settings
set smartindent      " Enable autoindentation
set tabstop=2        " Default tabstop
set softtabstop=2
set shiftwidth=4
set smarttab         "Insert tabs on the srat line according to the shiftwidth.
set ai               "Auto indent
set si               "Smart indent
set wrap             "Wrap lines

" }}}
"  Section Vim-Plug setting {{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugins')

" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails', { 'for': 'ruby' }

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" super simple vim plugin to show the list of buffers in the command bar
Plug 'bling/vim-bufferline'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration
Plug 'edkolev/tmuxline.vim'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'for': 'go' }

" Vim Plugin for the scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" Fuzzy finder
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Color Scheme Plugins
Plug 'altercation/vim-colors-solarized'

call plug#end()
filetype plugin indent on

" }}}
" Section Auto group command {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4

    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4

    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType ruby setlocal listchars=tab:+\ ,eol:¬
    autocmd FileType ruby setlocal textwidth=80
    "autocmd FileType ruby setlocal colorcolumn=-4
    "autocmd BufEnter *.rb colorscheme railscasts

    autocmd FileType sh setlocal tabstop=4
    autocmd FileType sh setlocal shiftwidth=4
    autocmd FileType sh setlocal softtabstop=4

    autocmd FileType python setlocal commentstring=#\ %s

    autocmd BufEnter *.cls setlocal filetype=java

    autocmd BufEnter *.zsh-theme setlocal filetype=zsh

    autocmd BufEnter Makefile setlocal noexpandtab

    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" }}}
" Section Airline {{{
set t_Co=256
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" let g:airline_theme='badwolf'
let g:airline_theme='angr'
let g:airline_powerline_fonts              = 1
let g:airline#extensions#branch#enable     = 1
let g:airline#extensions#syntastic#enable  = 1
let g:airline#extensions#tabline#enabled   = 1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" }}}
" Section Tmuxline {{{

let g:tmuxline_separators = {
            \ 'left' : '',
            \ 'left_alt': '>',
            \ 'right' : '',
            \ 'right_alt' : '<',
            \ 'space' : ' '}
let g:tmuxline_preset = {
            \'win'  : ['#I', '#W'],
            \'cwin' : ['#I', '#W', '#F'],
            \'y'    : ['%R', '%a', '%Y']}
" }}}
" Section Mapping {{{
" Quick Window Movement  H -> left window, L -> right window, J -> button window, K -> top window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Normalize all split sizes
nnoremap <C-=> <C-W><C-=>
nnoremap ,ff :FZF<CR>
nnoremap ,tt :TagbarToggle<CR>
nnoremap ,ll :IndentLinesToggle<CR>
nnoremap ,ls :LeadingSpaceToggle<CR>
nnoremap ,tl :call ToggleIntentLineLeadingSpace()<CR>
nnoremap ,tw :call TrimWhitespace()<CR>
nnoremap ,e  :Explore<CR>

" }}}
" Section indentLine {{{
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" }}}
" Section Custom Functions {{{
function! ToggleIntentLineLeadingSpace()
    :IndentLinesToggle
    :LeadingSpaceToggle
endfunction

function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunction
" }}}
