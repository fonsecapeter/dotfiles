set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hhsnopek/vim-firewatch'
Plugin 'scrooloose/nerdtree'
Plugin 'raimondi/delimitmate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'noahfrederick/vim-noctu'
Plugin 'avakhov/vim-yaml'
Plugin 'kh3phr3n/python-syntax'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

call vundle#end()

syntax on
set number
set relativenumber
let g:python_highlight_all = 1
autocmd BufNewFile,BufReadPost *.dtml, *.lxml set syntax=html
autocmd BufNewFile,BufReadPost *.json set syntax=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.txt set filetype=yaml

" colorscheme firewatch
colorscheme noctu

" show status bar
set laststatus=2

" indenting
set et
set ts=4
set sw=4
let g:indentLine_char = '|'
let g:indentLine_setColors = 0
highlight Conceal ctermbg=None ctermfg=0

" Nerd Tree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree"
" toggle nerd tree
map <C-\> :NERDTreeToggle<ESC>

" auto open if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto open if dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" multicursor
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<S-d>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" air-line
set noshowmode
let g:airline_theme='base16_ashes'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\u2002"

" unicode symbols
" let g:airline_left_sep = '▶'
let g:airline_left_sep = ''
" let g:airline_right_sep = '◀'
let g:airline_right_sep = ''
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = ''
" let g:airline_symbols.branch = '⎇'
let g:airline_symbols.branch = ''
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = 'RO'

" https://github.com/vim-airline/blob/master/doc/airline.txt
" ignore git hunks & branch
let g:airline_section_b = ''
" ignore tagbar, filetype, virtualenv
let g:airline_section_x = ''
" ignore fileemcoding, fileformat
let g:airline_section_y = ''
" simplify line no/col
" let g:airline_section_z = '%l/%L:%c %3p%%'
let g:airline_section_z = '%l/%L:%c'
" ------------------------------------------

" delete while in insert mode
set backspace=indent,eol,start

" mappings (aliases)
" for line insertion in normal mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>


" for split windows like sublime origami
" navigating
nnoremap <C-K><Down> <C-W><C-J>
nnoremap <C-K><Up> <C-W><C-K>
nnoremap <C-K><Right> <C-W><C-L>
nnoremap <C-K><Left> <C-W><C-H>

" moving the window
nnoremap <C-K><S-Down> <C-W><S-J>
nnoremap <C-K><S-Up> <C-W><S-K>
nnoremap <C-K><S-Right> <C-W><S-L>
nnoremap <C-K><S-Left> <C-W><S-H>

" supposed to rotation but not working
nnoremap <C-K><C-Right> <C-W><R>
nnoremap <C-K><C-Left> <C-W><S-R>

" PEP8
au BufNewFile,BufRead *.py
  \ set tabstop=4
" \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix


set encoding=utf-8

let python_highlight_all=1

