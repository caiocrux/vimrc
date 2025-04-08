" ======================
"  Vim Basic Settings
" ======================
set splitright
set splitbelow
set cursorline
set showmatch
set number

" Indentation
set ts=4
set shiftwidth=4
set expandtab
set autoindent

" Colors and Syntax
syntax enable
colorscheme industry

" ======================
"  Plugin Management
" ======================
execute pathogen#infect()
call plug#begin('~/.vim/plugged')

" Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Support
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP support
Plug 'dense-analysis/ale' " Syntax checking & linting

" Productivity
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'

call plug#end()

" ======================
"  Plugin Configurations
" ======================
" NERDTree
let g:NERDTreeWinPos = "left"
nmap <F5> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_left = 1
nnoremap <F9> :TagbarToggle<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" COC (Autocompletion)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ALE
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

" ======================
"  Language Specific
" ======================
" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
let python_highlight_all = 1

" Rust
let g:rustfmt_autosave = 1
autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType rust nnoremap <leader>b :!cargo build<CR>
autocmd FileType rust nnoremap <leader>r :!cargo run<CR>
autocmd FileType rust nnoremap <leader>t :!cargo test<CR>

" ======================
"  Key Mappings
" ======================
" Function Keys
nmap <F2> :set invnumber<CR>
nmap <F3> :tabprevious<CR>
nmap <F4> :tabnext<CR>
nmap <F6> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nmap <F7> :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
nmap <F8> :%!clang-format<CR>
vmap <F8> :!clang-format<CR>

" Window Management
nnoremap <S-Left>  :vertical resize -2<CR>
nnoremap <S-Right> :vertical resize +2<CR>
nnoremap <S-Up>    :resize +2<CR>
nnoremap <S-Down>  :resize -2<CR>

" Tags Navigation
:set tags=/home/caio-cruz/projects/windriver/repos/zl3073x/tags
function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction
nnoremap <c-]> :call FollowTag()<CR>

" ======================
"  Legacy Taglist Config
" ======================
let Tlist_Auto_Open = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 55
