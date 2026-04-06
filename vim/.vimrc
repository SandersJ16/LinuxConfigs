"set term=xterm-256color

set number         " add line numbers
syntax on          " turn on Syntax highlighting by default
colorscheme slate   "Set Colour Scheme

" Use system clipboard automatically (if available)
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
  " Copy visual selection with Ctrl+C
  vnoremap <D-c> "+y
  " Cut visual selection with Ctrl+X
  vnoremap <D-x> "+d
  " Paste in normal and visual mode with Ctrl+V
  nnoremap <D-v> "+gP
  vnoremap <D-v> "+gP
else
  "+xterm_clipboard must be installed (try installing vim-gnome if it's not"
  set clipboard=unnamedplus "Linux
endif

" Copy visual selection with Ctrl+C
vnoremap <C-c> "+y
" Cut visual selection with Ctrl+X
vnoremap <C-x> "+d
" Paste in normal and visual mode with Ctrl+V
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP

"Make delete no longer copy to clipboard
nnoremap d "_d
nnoremap x "_x
"Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"Set shift+tab to be a literal tab character
inoremap <S-Tab> <C-V><Tab>

" map Mac OS X Terminal.app default Home and End
"map <ESC>[H <Home>
"map <ESC>[F <End>
"imap <ESC>[H <C-O><Home>
"imap <ESC>[F <C-O><End>
"cmap <ESC>[H <Home>
"cmap <ESC>[F <End>

" Force characterwise paste after cursor
"nmap <Leader>p :call Paste(v:register, "v", "p")<CR>
" Force characterwise paste before cursor
"nmap <Leader>P :call Paste(v:register, "v", "P")<CR>

"Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set cursorline	    " highlight current line
set showmatch	    " highlight matching [{()}]

set incsearch       " search as characters are entered
set hlsearch        " highlight matches

set nowrap          " disable line wrapping

set mouse=a         " Enable Scrolling with scroll wheel

set re=0            " Enable new regex engine for syntax highlighting


" vim-plug, list plugins to install (https://github.com/junegunn/vim-plug)
call plug#begin()

"Plug 'tpope/vim-sensible'
Plug 'prisma/vim-prisma'

call plug#end()
