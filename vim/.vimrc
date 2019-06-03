set number         " add line numbers
syntax on          " turn on Syntax highlighting by default

"Make copy, paste and cut use the global clipboard
"+xterm_clipboard must be installed (try installing vim-gnome if it's not"
set clipboard=unnamedplus

"Remap yanking to go to clipboard
vnoremap <C-c> "*y
"Make delete no longer copy to clipboard
nnoremap d "_d
nnoremap x "_x
"Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"Set Colour Scheme
colorscheme slate

"Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set cursorline	    " highlight current line
set showmatch	    " highlight matching [{()}]

set incsearch       " search as characters are entered
set hlsearch        " highlight matches
