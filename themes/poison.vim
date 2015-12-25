"
" Colorscheme: Poison
" Matthias Hericks (Edit of 'Kalisi' by Arthur Jaron)
" matthias.hericks@gmail.com
" 24.12.2015
"
 
let g:airline#themes#poison#palette = {}

function! airline#themes#poison#refresh()

  let s:StatusLine   = [ '#ffffff' , '#e80000', '251', '236']
  let s:StatusLineNC = [ '#ffffff' , '#e80000', '151', '236']

  " Insert mode                        FG     BG
  let s:I1 = [ '#ffffff' , '#e80000', '166', '214']
  let s:I2 = [ '#ff0000' , '#5f0000', '214', '166']
  let s:I3 = s:StatusLine

  " Normal mode
  let s:N1 = [ '#005f00' , '#afd700','22','148'] 
  let s:N2 = [ '#afd700' , '#005f00','148','22'] 
  let s:N3 = s:StatusLine

  " Visual mode                                   
  let s:V1 = [ '#0087ff' , '#ffffff','255','33']
  let s:V2 = [ '#005faf' , '#5fafff','231','25']
  let s:V3 = s:StatusLine

  " Replace mode
  let s:R1 = [ '#d75fff' , '#ffffff','254','160']
  let s:R2 = [ '#5f005f' , '#d75fff','196','52']
  let s:R3 = s:StatusLine

  " Tabline Plugin
  let g:airline#themes#poison#palette.tabline = {
        \ 'airline_tab':    ['#bcbcbc', '#005f00','250','22'],
        \ 'airline_tabsel': ['#404042', '#A6DB29','238','148'],
        \ 'airline_tabtype':['#afd700', '#204d20','148','22'],
        \ 'airline_tabfill': s:StatusLine,
        \ 'airline_tabhid': ['#c5c5c5', '#404042','251','238'],
        \ 'airline_tabmod': ['#d7ff00', '#afd700','190','148'],
        \ 'airline_tabmod_unsel':  ['#d7ff00', '#005f00','190','22']
        \ }

  let g:airline#themes#poison#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  let g:airline#themes#poison#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#poison#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#poison#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

  " Inactive Mode
  let s:IA = airline#themes#get_highlight('StatusLineNC')
  let g:airline#themes#poison#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#poison#palette.inactive_modified = {
        \ 'airline_c':  ['#d7ff00', s:IA[1],'190',s:IA[3]],
        \ }

endfunction

call airline#themes#poison#refresh()

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#poison#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ s:StatusLine,
      \ ['#afd700', '#005f00','148','22'],
      \ [ '#005f00' , '#afd700' , '22','148']
      \)

