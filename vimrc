" GENERAL OPTIONS
set nocompatible        " Act like vim not vi
set viminfo='20,\"500,% " ' Maximum number of previously edited files for
                        "   which the marks are remembered.  
                        " " Maximum number of lines saved for each register.
                        " % When included, save and restore the buffer list.
                        "   If Vim is started with a file name argument, the
                        "   buffer list is not restored.  If Vim is started
                        "   without a file name argument, the buffer list is
                        "   restored from the viminfo file.  Buffers without a
                        "   file name and buffers for help files are not
                        "   written to the viminfo file.
set history=150         " keep {number} lines of command line history

set printoptions=paper:letter,syntax:n,number:y
                        " printoptions affects the ':hardcopy' command.

" TAB HANDLING, C program formatting:
set tabstop=8           " ts, When on, a <Tab> in front of a line inserts
                        "     blanks according to 'shiftwidth'.  'tabstop' is
                        "     used in other places.
set shiftwidth=3        " sw, number of spaces shifted left and right when
                        "     issuing << and >> commands
set smarttab            " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=3       "     number of spaces that a tab *pressed by the
                        "     user* is equivalent to
set shiftround          " round to 'shiftwidth' for "<<" and ">>"
set expandtab           " don't input tabs; replace with spaces.
                        "     <local to buffer>

" see Vim book p 71 for this; first set defaults.
set autoindent          " automatically set the indent of a new line
                        "    (local to buffer)
set nosmartindent       " no clever autoindenting (local to buffer); let
                        "    cindent do it

" Make breaks more obvious
set showbreak=+++\ \
set numberwidth=4

syntax on               " colorize

" VIM DISPLAY OPTIONS
set showmode            " show which mode (insert, replace, visual)
set ruler               " show line and column numbers in status line
set title               " show window titles if windowing system allows it
set showcmd             " show commands in status line when typing
set wildmenu            " enhanced command and file completion (with <tab>)     

:map <F2> :set filetype=c<cr>i/**<cr>Description of File<cr><cr>@author Dirk Cummings<cr>@version Program/Lab<cr>@version CPE XXX<cr>@version Fall 2009<cr>*/<cr><cr>#include <stdio.h><cr>#include <stdlib.h><cr>#include <sys/types.h><cr>#include <sys/stat.h><cr>#include <fcntl.h><cr>#include <unistd.h><cr><cr>int main(int argc, char *argv[])<cr>{<cr><cr><tab>return 0;<cr><bs>}<esc>kka<tab>

:colorscheme desert
:set number
:set hls
:set hlsearch

filetype on          " recognize sytax by file extension
filetype plugin on   " look at .vim/ftplugin
filetype indent on   " check for indent file

set ignorecase       " ignore case in search patterns
set smartcase        " searches are case-sensitive if caps used
set incsearch        " immediately highlight search matches
set noerrorbells     " no beeps on errors
set showcmd          " show partial commands in the status line
set showmatch        " show matching () {} etc.

set scrolloff=5

" Remove trailing spaces form lines w/ F6: http://vim.wikia.com/wiki/Remove_unwanted_spaces
:nnoremap <silent> <F6> :let _s=@<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Toggle spell checking
:map <F7> :set spell!<cr>

" Use space ky to open and close code folds
:vnoremap <space> zf<CR>
:nnoremap <space> zd<CR>

" For pasting
:nnoremap <C-p><C-p> :set invpast<CR>

" Folding settings
set foldmethod=manual      " fold based on manual (use visual mode then zf)
set foldnestmax=10         " deepest fold is 10 levels
set nofoldenable           " don't fold by default

" Setup folding for .c Files to Syntax based
au BufRead,BufNewFile *.c set foldmethod=syntax
au BufRead,BufNewFile *.cpp set foldmethod=syntax
au BufRead,BufNewFile *.cs set foldmethod=syntax

" Setup folding for java files to Syntax based
au BufRead,BufNewFile *.java set foldmethod=syntax

" Setup folding for python Files to Indent based
" use zm to fold more (fold the furthest indents first), then zr to fold less
au BufRead,BufNewFile *.py set foldmethod=indent


" Makefiles
au BufRead,BufNewFile [Mm]akefile* set noet ts=8 sw=8 nocindent list lsc=tab:>-,trail:x
