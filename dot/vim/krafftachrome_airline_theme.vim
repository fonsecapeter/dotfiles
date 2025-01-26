" vim-airline template by chartoin (http://github.com/chartoin)
" Krafftachrome Scheme by Peter Fonseca (https://github.com/fonsecapeter)
let g:airline#themes#krafftachrome#palette = {}

let s:gui_obsidian = '#2d2d34'
let s:gui_treeline_green = '#688E85'
let s:gui_lava_orange = '#EA9038'
let s:gui_acid_lake_deep = '#9dA883'
let s:gui_lava_red = '#f2641d'
let s:gui_katias_jacket_blue = '#5596B0'
let s:gui_light_ash_gray = '#B8AAB7'

" cterm_obsidian from using reverse
let s:cterm_hot_obsidian_purple = 0
let s:cterm_treeline_green = 2
let s:cterm_lava_orange = 3
let s:cterm_acid_lake_deep = 6
let s:cterm_lava_red = 1
let s:cterm_katias_jacket_blue = 12
let s:cterm_light_ash_gray = 15

" Main middle-section
let s:MAIN = [ s:gui_obsidian, s:gui_acid_lake_deep, s:cterm_acid_lake_deep, '', 'reverse']

let s:N1 = [ s:gui_obsidian, s:gui_treeline_green, s:cterm_treeline_green, '', 'reverse' ]
let g:airline#themes#krafftachrome#palette.normal = airline#themes#generate_color_map(s:N1, s:MAIN, s:MAIN)

let s:I1 = [ s:gui_obsidian, s:gui_lava_orange, s:cterm_lava_orange, '', 'reverse']
let g:airline#themes#krafftachrome#palette.insert = airline#themes#generate_color_map(s:I1, s:MAIN, s:MAIN)

let s:R1 = [ s:gui_obsidian, s:gui_lava_red, s:cterm_lava_red, '', 'reverse' ]
let g:airline#themes#krafftachrome#palette.replace = airline#themes#generate_color_map(s:R1, s:MAIN, s:MAIN)

let s:V1 = [ s:gui_obsidian, s:gui_katias_jacket_blue, s:cterm_katias_jacket_blue, '', 'reverse' ]
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
      \ [ s:gui_obsidian, s:gui_acid_lake_deep, s:cterm_acid_lake_deep, '', 'reverse' ],
      \ [ s:gui_light_ash_gray, s:gui_obsidian, s:cterm_light_ash_gray, '', '' ],
      \ [ s:gui_obsidian, s:gui_acid_lake_deep, s:cterm_acid_lake_deep, '', 'reverse bold' ])
