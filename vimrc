set nocompatible
filetype off

" Vundle
" -----------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'w0rp/ale'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'raimondi/delimitmate'
Plugin 'junegunn/goyo.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/limelight.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kh3phr3n/python-syntax'
Plugin 'mechatroner/rainbow_csv'
Plugin 'bling/vim-airline'
Plugin 'nvie/vim-flake8'
Plugin 'rhysd/vim-gfm-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'shime/vim-livedown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'noahfrederick/vim-noctu'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'avakhov/vim-yaml'

call vundle#end()
" -----------------------------------------

" base config
" -----------------------------------------
syntax on
set number
set relativenumber
" show status bar
set laststatus=2
set encoding=utf-8
set t_Co=16
set background=dark
colorscheme noctu

autocmd BufNewFile,BufReadPost *.html, *.dtml, *.lxml set filetype=htmldjango
autocmd BufNewFile,BufReadPost *.html, *.dtml, *.lxml set syntax=htmldjango
autocmd BufNewFile,BufReadPost *.json set syntax=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.txt set filetype=markdown
autocmd BufNewFile,BufReadPost *.ronn set filetype=markdown
autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost *.{txt,md,y*ml,cfg,ini} :Goyo 120
autocmd BufNewFile,BufReadPost bash_profile set syntax=sh
autocmd BufNewFile,BufReadPost vimrc set syntax=vim
" for now, the only time i read from stdin is for manpages
autocmd StdinReadPost * set ft=man

autocmd BufWritePre * :FixWhitespace

" quit all (great for in goyo)
command Q qa

" set cursor highlighting in current window
augroup CursorLine
  " why you change ctermfg based on ctermbg, osx vim??? D:
  if !has('macunix')
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  endif
augroup END
" hi CursorLine ctermbg=None

" delete while in insert mode
set backspace=indent,eol,start
" -----------------------------------------

" ale
" -----------------------------------------
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_args = '-m flake8'
" -----------------------------------------

" ctrlp
" -----------------------------------------
" fuzzy file finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rca'
" -----------------------------------------

" goyo.vim + limelight.vim
" -----------------------------------------
" immersive periferal hiding (with auto limelight)
" :Goyo
let g:limelight_conceal_ctermfg = 8
let g:goyo_width = 120
function! s:goyo_enter()
  silent! Limelight
  GitGutterEnable
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave Limelight!
" -----------------------------------------

" indent and indentLine
" -----------------------------------------
" default intent settings and indentline guides
if @% !~# 'Makefile'
  set et
  set ts=2
  set sw=2
endif

set autoindent
set smartindent
let g:indentLine_char = '|'
let g:indentLine_setColors = 0
highlight Conceal ctermbg=None ctermfg=0
autocmd ColorScheme * highlight Conceal ctermbg=None ctermfg=0
" for 4 space indentation
autocmd BufNewFile,BufReadPost *.py setlocal ts=4 sw=4 expandtab
autocmd BufNewFile,BufReadPost *.html setlocal ts=4 sw=4 expandtab
autocmd BufNewFile,BufReadPost *.dtml setlocal ts=4 sw=4 expandtab
autocmd BufNewFile,BufReadPost *.js setlocal ts=4 sw=4 expandtab
autocmd BufNewFile,BufReadPost *.jsx setlocal ts=4 sw=4 expandtab
autocmd BufNewFile,BufReadPost *.scss setlocal ts=4 sw=4 expandtab
" -----------------------------------------

" nerdtree
" -----------------------------------------
" file tree
let NERDTreeIgnore=['\.pyc$', '\~$', '^node_modules$', '^venv$', '^\.cache$'] "ignore files in NERDTree"
" toggle nerd tree
map <C-\> :NERDTreeToggle<ESC>

" auto open if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto open if dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" auto open in new tab
let NERDTreeMapOpenInTab='<ENTER>'

let NERDTreeShowHidden = 1
" -----------------------------------------

" nerdcommenter
" -----------------------------------------
" \ c <space>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" -----------------------------------------

" python-syntax
" -----------------------------------------
let python_highlight_all=1
" -----------------------------------------

" rainbow_csv
" -----------------------------------------
let g:rcsv_colorpairs = [
  \ ['yellow',   'darkyellow'],
  \ ['magenta',     'darkmagenta'],
  \ ['blue',    'darkblue'],
  \ ['green', 'darkgreen'],
  \ ['NONE',        'NONE'],
  \ ]
" -----------------------------------------

" vim-airline
" -----------------------------------------
" bar at bottom (with my highly lightened customiation)
set noshowmode
let g:airline_theme='peter_fall'
let g:airline_symbols_ascii = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\u2002"

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = 'RO'

" :help airline > CUSTOMIZATION / ADVANCED CUSTOMIZATION
" :help statusline for %vars
" ignore git hunks & branch
let g:airline_section_b = ''
" ignore tagbar, filetype, virtualenv
let g:airline_section_x = ''
" ignore fileemcoding, fileformat
let g:airline_section_y = ''
" simplify line no/col
" let g:airline_section_z = '%l/%L:%c %3p%%'
let g:airline_section_z = '%l/%L:%c'

function! MyMode()
  let l:m = mode()
  if l:m ==# 'i'
    return 'insert'
  elseif l:m ==# 'n'
    return 'normal'
  elseif l:m =~# '\v(v|V|s|S|)'
    return 'visual'
  elseif l:m ==# 't'
    return 'terminal'
  elseif l:m ==# 'R'
    return 'replace'
  else
    return 'inactive'
  endif
endfunction

let g:airline_section_a = '%{MyMode()}'
" ------------------------------------------

" vim-flake8
" -----------------------------------------
" pep8 settings
au BufNewFile,BufRead *.py
  \ set tabstop=4
" \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix
" -----------------------------------------

" vim-gfm-syntax
" -----------------------------------------
let g:gfm_syntax_emoji_conceal = 1
let g:markdown_fenced_languages = ['ruby', 'python', 'json', 'sql']
" -----------------------------------------

" vim-livedown
" -----------------------------------------
" live markdown preview
" requires `npm install -g livedown`
" :LivedownToggle
let g:livedown_browser = "firefox"
" -----------------------------------------

" vim-multiple-cursors
" -----------------------------------------
" bart simpson mode
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<S-d>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" -----------------------------------------

" mappings (aliases)
" -----------------------------------------
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

" move through tabs
nnoremap > :tabnext<CR>
nnoremap < :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>

" ctags go to new tab
:nnoremap <C-]> <C-w><C-]><C-w>T
" -----------------------------------------
