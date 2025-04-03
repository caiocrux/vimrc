"Runtime Path Manipulation
execute pathogen#infect()
" Ctags Setting
filetype plugin on
:set tags=/home/caio-cruz/projects/sd_card/linux-yocto-01b1f32be4b0eb108c00b16ec4eef29ce7fa9546/tags
:set splitright
:set splitbelow
nmap <F2>  :set invnumber<CR>
nmap <F4>  :tabnext<CR>
nmap <F3>  :tabprevious<CR>

nmap <F5>  ::NERDTreeToggle<CR>
nmap <F6>  :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nmap <F7>  :call ColorColumn()<CR>
nnoremap <F9> :TagbarToggle<CR>

colorscheme industry
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

function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction
nnoremap <c-]> :call FollowTag()<CR>

" Format selected code with clang-format
vmap <F8> :!clang-format<CR>

" Format the entire file with F8 in normal mode
nmap <F8> :%!clang-format<CR>


" Format the entire file with F8 in normal mode
" Move between windows with Shift + Arrow keys
" Resize windows with Shift + Arrow keys
nnoremap <S-Left>  :vertical resize -2<CR>
nnoremap <S-Right> :vertical resize +2<CR>
nnoremap <S-Up>    :resize +2<CR>
nnoremap <S-Down>  :resize -2<CR>
call plug#begin('~/.vim/plugged')
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP support
Plug 'dense-analysis/ale' " Syntax checking & linting
Plug 'tpope/vim-surround' " Useful for editing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
let g:tagbar_left = 1

" rust stuff

" Enable Rust syntax highlighting and auto-formatting
let g:rustfmt_autosave = 1
" Use ALE for real-time linting and formatting
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

" Keybindings for Rust development
autocmd FileType rust nnoremap <leader>b :!cargo build<CR>
autocmd FileType rust nnoremap <leader>r :!cargo run<CR>
autocmd FileType rust nnoremap <leader>t :!cargo test<CR>

" Set tabs to 4 spaces
autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 expandtab

