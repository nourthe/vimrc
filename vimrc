" nourthe's vimrc settings
" Author and maintainer: Nahuel Ourthe <nahuelourthe@gmail.com>
" Public backup: http://github.com/nourthe/dots/tree/master/.vim
"
" LICENSE:
" You are free to read and study this bundle or snippets of it and to use
" it on your own vimrc settings. Feel free to tweak and adapt my vimrc to
" suit your needs and to make the changes yours. Attribution to this vimrc
" is not required although is thanked.

" +---------+
" | Plugins |
" +---------+
"
" Install plugins
call plug#begin('~/.vim/plugged')
" Emacs Org-Mode support
Plug 'jceb/vim-orgmode'

" Syntax check
Plug 'dense-analysis/ale'
" Languages
Plug 'sheerun/vim-polyglot'
" Auto pair
Plug 'tmsvg/pear-tree'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Vim Commentary
Plug 'tpope/vim-commentary'
" Vim surround
Plug 'tpope/vim-surround'
" Vim documentations
Plug 'Shougo/echodoc.vim'
" Vim Git
Plug 'airblade/vim-gitgutter'

" Airline
"Plug 'vim-airline/vim-airline'


"Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use `[e` and `]e` to navigate Ale wraps
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)


" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" +--------+
" | Config |
" +--------+
" GLOBAL MAPS
" Make Y effect to end of line instead of whole line
nmap Y y$
" Copy to system clipboard in Visual Mode
vnoremap <C-c> "+y
" Paste from system clipboard Insert Mode
inoremap <C-v> <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>


" Enable filetype
filetype indent plugin on

" Persist undo history between file editing sessions.
set undofile
set undodir=~/.vim/undodir

" Modify indenting settings
set autoindent              " autoindent always ON.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

set noshowmode
set laststatus=2        " always show powerline
set wildmenu            " enable visual wildmenu
set cmdheight=2         " give more space for displaying messages

set nowrap              " don't wrap long lines
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

" Searching
set incsearch
set ignorecase
set smartcase
set shortmess-=S	" Show number of search occurrences
set path+=**			" Search down into subfolders

set updatetime=300      " make vim more responsive
set signcolumn=number   " after 8.1.1564 vim merge signcol and numbercol

" Digraphs https://www.branah.com/unicode-converter
digraph NN 209
digraph AA 193
digraph EE 201
digraph II 205
digraph OO 211
digraph UU 218
digraph aa 225
digraph ee 233
digraph ii 237
digraph oo 243
digraph uu 250
digraph /~ 8769
digraph \~ 8769
digraph \|~ 8769
digraph ~\ 8769
digraph ~\ 8769
digraph ~\| 8769

let mapleader=","


" Make Y effect to end of line instead of whole line
nmap Y y$

" Shortcuts for switching the buffers
map <C-TAB> :bnext<CR>
map <C-S-TAB> :bprev<CR>
nmap <C-N> <Esc>:bnext<CR>
nmap <C-P> <Esc>:bprev<CR>
"imap <C-N> <Esc>:bnext<CR>i
"imap <C-P> <Esc>:bprev<CR>i


" +-------+
" | Theme |
" +-------+

" Colorscheme configuration.
if &t_Co > 2
  syntax enable
  silent! colorscheme dim
  set background=dark

  highlight Folded cterm=reverse ctermbg=0 ctermfg=8
  highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=8
  highlight Conceal cterm=NONE ctermbg=NONE ctermfg=8

  highlight DiffAdd ctermfg=green cterm=bold
  highlight DiffDelete ctermfg=red cterm=bold
  highlight DiffChange ctermfg=yellow
  highlight SpecialKey ctermfg=darkgrey

  set colorcolumn=80


  " Sometimes I see the syntax be out of sync
  noremap <F12> <Esc>:syntax sync fromstart<CR>
  inoremap <F12> <C-o>:syntax sync fromstart<CR>
endif

" Mark trailing spaces depending on whether we have a fancy terminal or not
if &t_Co > 2
  highlight ExtraWhitespace ctermbg=1
  match ExtraWhitespace /\s\+$/
  set list
  set listchars=tab:▸\ ,trail:×
else
  set listchars=trail:~
  set list
endif

" Use a specific pipe ch
set fillchars+=vert:\┊
" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
nmap <leader>tr :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a
" Clean hidden buffers (https://stackoverflow.com/a/8459043/2033517)
function DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

" Don't act like vi
set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!

