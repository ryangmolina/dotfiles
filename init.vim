let $vundle="~/.config/nvim/bundle/Vundle.vim"

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

  "-------------------=== Code/Project navigation ===-------------
  Plugin 'scrooloose/nerdtree'                " Project and file navigation
  Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
  "-------------------=== Other ===-------------------------------
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'rosenfeld/conque-term'               " Consoles as buffers
  Plugin 'ddrscott/vim-side-search'
  Plugin 'majutsushi/tagbar'
  "Plugin 'Yggdroot/indentLine'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

    "-------------------=== Languages support ===-------------------
  Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
  Plugin 'posva/vim-vue'
  Plugin 'othree/html5.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'vim-scripts/indentpython.vim'
  Plugin 'w0rp/ale'
  Plugin 'lepture/vim-jinja'
  Plugin 'psf/black'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'vim-jsx-typescript'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'numirias/semshi'

    "-------------------=== Colorscheme ===-------------------
  Plugin 'rafi/awesome-vim-colorschemes'
  Plugin 'yous/vim-open-color'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'chriskempson/base16-vim'
  Plugin 'NLKNguyen/papercolor-theme'
  Plugin 'mhartington/oceanic-next'
  Plugin 'rakr/vim-one'
  Plugin 'gko/vim-coloresque'

call vundle#end()                           " required

" let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" BASIC Vim settings
"=====================================================
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
set t_Co=256                                " set 256 colors
set termguicolors                           " set true colors inside tmux
let base16colorspace=256                   " Access colors present in 256 colorspace
set background=light
colorscheme PaperColor

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
set shiftwidth=4                            " shift lines by 4 spaces
"set smarttab                                " set tabs for a shifttabs logic
"set expandtab                               " expand tabs into spaces

" Indent
"set smartindent
"set autoindent                              " indent when moving to the next line while writing code

" Show invisibles by characters
set listchars=tab:→\ ,trail:·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set list

" Show extra space
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

au BufNewFile,BufRead *.vue setf vue
au FileType vue setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType js setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType typescript.tsx setl sw=2 sts=2 et
au FileType typescript setl sw=2 sts=2 et

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
  autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey
  autocmd FileType python,rst,c,cpp match Excess /\%90v.*/
  autocmd FileType python,rst,c,cpp set nowrap
  autocmd FileType python,rst,c,cpp set colorcolumn=80
  autocmd FileType js,javascript,json set tabstop=2
augroup END

"=====================================================
"" Plugin settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$', 'venv', 'node_modules']     " Ignore files in NERDTree
let NERDTreeWinSize=40
let NERDTreeShowHidden=1
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:ctrlp_custom_ignore = '\v[\/](**node_modules|**target|**dist|**webpack|**venv)|(\.(swp|ico|git|svn))$'

let g:vue_disable_pre_processors = 1
autocmd FileType vue syntax sync fromstart
" Javascript
let g:javascript_plugin_jsdoc = 1

" =========================
" ------- Side search -----
" =========================
let g:side_search_prg = 'ag --word-regexp'
  \. " --ignore='*.js.map'"
  \. " --heading --stats -B 1 -A 4"
" Can use `vnew` or `new`
let g:side_search_splitter = 'vnew'
let g:side_search_split_pct = 0.30
" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
" Create an shorter `SS` command
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
" or command abbreviation
cabbrev SS SideSearch

" Remove highlight of searched items
nmap <esc><esc> :noh<return>


"" Unknown
let g:mta_filetypes = {
  \ 'javascript.jsx': 1,
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'vue': 1,
  \}

nmap <F8> :TagbarToggle<CR>

let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

nnoremap H gT
nnoremap L gt
tnoremap <Esc> <C-\><C-n>


" " Equivalent to the above.
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8', 'black'],
  \ 'typescript': ['tsserver', 'tslint'],
  \ 'vue': ['eslint'],
\}


let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'typescript': ['prettier'],
  \ 'javascript': ['eslint'],
  \ 'scss': ['prettier'],
  \ 'html': ['prettier'],
\}

let g:ale_cache_executable_check_failures = 1
let g:ale_virtualenv_dir_names = []

let g:airline#extensions#ale#enabled = 1

" let g:ale_lint_on_save = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5

" Write this in your vimrc file
"let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0

autocmd BufWritePre *.py execute ':Black'

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript


hi semshiLocal           ctermfg=209 guifg=#ff875f
" Dark ver
"hi semshiGlobal          ctermfg=214 guifg=#ffaf00
"hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
"hi semshiParameter       ctermfg=75  guifg=#5fafff
"hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
"hi semshiFree            ctermfg=218 guifg=#ffafd7
"hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
"hi semshiAttribute       ctermfg=49  guifg=#00ffaf
"hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline

" Light ver
hi semshiGlobal          ctermfg=214 guifg=#cc4f00
hi semshiImported        ctermfg=214 guifg=#cc4f00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#005f87
hi semshiParameterUnused ctermfg=117 guifg=#5fafff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#8700af
hi semshiAttribute       ctermfg=49  guifg=#008700
hi semshiSelf            ctermfg=249 guifg=#5f8700
hi semshiUnresolved      ctermfg=226 guifg=#878787 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign
