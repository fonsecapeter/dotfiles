set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
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

call vundle#end()
filetype plugin indent on

syntax on
set number
set relativenumber
let g:python_highlight_all = 1
autocmd BufNewFile,BufReadPost *.dtml set syntax=html
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
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guide_start_level=2
let g:indent_guides_guide_size=1

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
let g:airline_theme='base16_ashes'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\u2002"

" unicode symbols
let g:airline_left_sep = ''
" let g:airline_left_sep = '▶'
let g:airline_right_sep = ''
" let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

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
