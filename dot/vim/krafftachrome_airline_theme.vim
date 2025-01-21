" vim-airline template by chartoin (http://github.com/chartoin)
" Krafftachrome Scheme by Peter Fonseca (https://github.com/fonsecapeter)
let g:airline#themes#krafftachrome#palette = {}

let s:gui_hot_obsidian_purple = '#663759'
let s:gui_treeline_green = '#688E85'
let s:gui_lava_orange = '#EA9038'
let s:gui_acid_lake_deep = '#9dA883'
let s:gui_lava_bright_red = '#f34822'
let s:gui_katias_jacket_blue = '#5596B0'
let s:gui_light_ash_gray = '#B8AAB7'

let s:cterm_hot_obsidian_purple = 0
let s:cterm_treeline_green = 2
let s:cterm_lava_orange = 3
let s:cterm_acid_lake_deep = 6
let s:cterm_lava_bright_red = 9
let s:cterm_katias_jacket_blue = 12
let s:cterm_light_ash_gray = 15

" Main middle-section
let s:MAIN = [ s:gui_hot_obsidian_purple, s:gui_acid_lake_deep, s:cterm_hot_obsidian_purple, s:cterm_acid_lake_deep ]

let s:N1 = [ s:gui_hot_obsidian_purple, s:gui_treeline_green, s:cterm_hot_obsidian_purple, s:cterm_treeline_green ]
let g:airline#themes#krafftachrome#palette.normal = airline#themes#generate_color_map(s:N1, s:MAIN, s:MAIN)

let s:I1 = [ s:gui_hot_obsidian_purple, s:gui_lava_orange, s:cterm_hot_obsidian_purple, s:cterm_lava_orange ]
let g:airline#themes#krafftachrome#palette.insert = airline#themes#generate_color_map(s:I1, s:MAIN, s:MAIN)

let s:R1 = [ s:gui_hot_obsidian_purple, s:gui_lava_bright_red, s:cterm_hot_obsidian_purple, s:cterm_lava_bright_red ]
let g:airline#themes#krafftachrome#palette.replace = airline#themes#generate_color_map(s:R1, s:MAIN, s:MAIN)

let s:V1 = [ s:gui_hot_obsidian_purple, s:gui_katias_jacket_blue, s:cterm_hot_obsidian_purple, s:cterm_katias_jacket_blue ]
let g:airline#themes#krafftachrome#palette.visual = airline#themes#generate_color_map(s:V1, s:MAIN, s:MAIN)

let g:airline#themes#krafftachrome#palette.inactive = airline#themes#generate_color_map(s:MAIN, s:MAIN, s:MAIN)

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 1)
  finish
endif
let g:airline#themes#krafftachrome#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui_hot_obsidian_purple, s:gui_acid_lake_deep, s:cterm_hot_obsidian_purple, s:cterm_acid_lake_deep, '' ],
      \ [ s:gui_light_ash_gray, s:gui_hot_obsidian_purple, s:cterm_light_ash_gray, s:cterm_hot_obsidian_purple, '' ],
      \ [ s:gui_hot_obsidian_purple, s:gui_acid_lake_deep, s:cterm_hot_obsidian_purple, s:cterm_acid_lake_deep, 'bold' ])
