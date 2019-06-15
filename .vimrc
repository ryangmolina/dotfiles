" Use Vim settings, rather than Vi settings
set nocompatible

" General settings
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
set exrc                                    " enable usage of additional .vimrc files from working directory
set enc=utf-8                               " utf-8 by default
set ttyfast                                 " terminal acceleration
set number                                  " show line numbers
set autoread                                " Read file when modified outside Vim

" Colors
syntax on
syntax enable                               " syntax highlight
"set t_Co=256                                " set 256 colors
"set termguicolors                           " set true colors inside tmux
"let base16colorspace=256                   " Access colors present in 256 colorspace

" Search settings
set incsearch                               " incremental search
set hlsearch                                " highlight search results

" Do not keep any history
set nobackup                                " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile                              " no swap files

" Allow backspacing over everything in INSERT mode
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

" Show ruler and command visual aid
set ruler
set showcmd

" Set partial search and result highlighting
set incsearch
set hlsearch

" Show matching bracets
set showmatch                               " shows matching part of bracket pairs (), [], {}

" Highlight the cursor line
set cursorline                              " shows line under the cursor's line

" Set default vertical split to right
set splitright

" Tabs
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set softtabstop=4
set shiftwidth=4                            " shift lines by 4 spaces
set expandtab                               " expand tabs into spaces

" Indent
set smartindent
set autoindent                              " indent when moving to the next line while writing code

" Show invisibles by characters
set listchars=tab:→\ ,trail:·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set list

" Show invisibles by highlighting
"hi ExtraWhitespace ctermbg=DarkGrey guibg=DarkGrey
"match ExtraWhitespace /\s\+$/

" Remove trailing white space
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Timeout for tmux
set ttimeoutlen=50

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Clipboards
set clipboard+=unnamedplus          " use the clipboards of vim and win
set paste                           " Paste from a windows or from vim
set go+=a                           " Visual selection automatically copied to the clipboard


" File specific tabs
au BufNewFile,BufRead *.vue setf vue
au FileType vue setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType js setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix


" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
  autocmd!
  autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Orange
  autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
  autocmd FileType python,rst,c,cpp set nowrap
  autocmd FileType python,rst,c,cpp set colorcolumn=80
  autocmd FileType js,javascript set tabstop=2
augroup END

