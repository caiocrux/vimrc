"Runtime Path Manipulation
execute pathogen#infect()
" Ctags Setting
filetype plugin on
:set tags=/home/tpv/dev/uatu/pc/tags
nmap <F2>  :set invnumber<CR>
nmap <F4>  :tabnext<CR>
nmap <F3>  :tabprevious<CR>

nmap <F5>  ::NERDTreeToggle<CR>
nmap <F6>  :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nmap <F7>  :call ColorColumn()<CR>
colorscheme zellner
syntax on 

" Taglist settings
let Tlist_Auto_Open = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 55

" Python Setting
" enable syntax highlighting
syntax enable
" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all = 1
autocmd Filetype python set omnifunc=pythoncomplete#Complete
nnoremap <F7> :execute "set colorcolumn="
                  \ . (&colorcolumn == "" ? "80" : "")<CR>
