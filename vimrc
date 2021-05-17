"=============================================================
"=          __  __                                           =             
"=         /\ \/\ \  __                                      =
"=         \ \ \ \ \/\_\    ___ ___   _ __   ___             =
"=          \ \ \ \ \/\ \ /' __` __`\/\`'__\/'___\           =
"=           \ \ \_/ \ \ \/\ \/\ \/\ \ \ \//\ \__/           =
"=            \ `\___/\ \_\ \_\ \_\ \_\ \_\\ \____\          =
"=             `\/__/  \/_/\/_/\/_/\/_/\/_/ \/____/          =
"=                                                           = 
"=                                  By Simon Robles          =
"=============================================================

filetype plugin indent on
syntax on
packloadall
set encoding=utf-8
set backspace=indent,eol,start
set hidden
set noswapfile
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
set pastetoggle=<F2>
set lazyredraw 
set wrap linebreak nolist
hi ColorColumn ctermbg=8

" Display 'n' lines above/below the cursor when scrolling with a mouse
set scrolloff=5

"Search Settings
set incsearch
set ignorecase

" Path Variables
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"
let $ATTY="$HOME/.config/alacritty/alacritty.yml"
set path=.,**   

"====================================================================
"=                       SYNTAX HIGHLIGHTING                        =
"====================================================================

syntax enable
set cursorline
highlight Comment ctermfg=07
highlight LineNr ctermfg=07 
highlight Statement ctermfg=05

hi clear CursorLine
hi CursorLineNr term=bold cterm=bold ctermfg=03 ctermbg=08 gui=bold
hi CursorLine ctermbg=08

hi clear Visual
hi Visual term=reverse ctermfg=0 ctermbg=15

"====================================================================
"=                              LIST MODE                           =
"====================================================================
set listchars=space:·,trail:·,eol:¶
nmap <F3> :set list!<CR> 

"====================================================================
"=                            VIM STATUSLINE                        =
"====================================================================
" For more information see https://shapeshed.com/vim-statuslines/
" Also see https://learnvimscriptthehardway.stevelosh.com/chapters/17.html
" Tells vim to always display the status line
set laststatus=2

" Colors for the status line (use 0-15 for system colors)
hi User1 ctermfg=15     ctermbg=8
hi User2 ctermfg=0      ctermbg=7
hi User3 ctermfg=8      ctermbg=7
hi User4 ctermfg=0      ctermbg=3
hi User5 ctermfg=0      ctermbg=6
hi User6 ctermfg=8      ctermbg=8

hi User7 ctermfg=8      ctermbg=none
hi User8 ctermfg=6      ctermbg=8
hi User9 ctermfg=none   ctermbg=8

set statusline=
set statusline+=%4*\ %f\   
set statusline+=%1*\ %{mode()}
set statusline+=%1*\ %m
set statusline+=%1*%=
set statusline+=%1*\ %2*\ %v\ %3*┃%2*\ %l\/%L
set statusline+=\ %2*%5*\ %Y\  

"set statusline=
"set statusline+=%2*%3*%f%4*
"set statusline+=\ %1*\ %1*%{mode()}
"set statusline+=%1*\ %m%7*
"set statusline+=%9*%=
"set statusline+=\ %7*%1*\ %v:%l\/%L
"set statusline+=\ %8*%6*\ %Y\ %5*

"====================================================================
"=                              TABLINE                             =
"====================================================================
hi TabLine      ctermfg=Black  ctermbg=Gray     	cterm=NONE
hi TabLineFill  ctermfg=White  ctermbg=8     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=Black  		cterm=NONE

set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
	" select the highlighting
	if i + 1 == tabpagenr()
	  let s .= '%#TabLineSel#'
	else
	  let s .= '%#TabLine#'
	endif

	" set the tab page number (for mouse clicks)
	let s .= '%' . (i + 1) . 'T'

	" the label is made by MyTabLabel()
	let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

 " right-align the label to close the current tab page
 " if tabpagenr('$') > 1
 "   let s .= '%=%#TabLine#%999Xclose'
 " endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  "return bufname(buflist[winnr - 1])
  "return pathshorten(fnamemodify(bufname(buflist[winnr - 1]), ':~:.'))
  return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

"====================================================================
"=                              NERD TREE                           =
"====================================================================
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = '' 
nmap <F6> :NERDTreeToggle<CR>
