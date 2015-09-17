set nocompatible
set runtimepath+=~/.vim_runtime
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set rtp+=~/.fzf
set history=200
set spell
set spelllang=en_us
set foldmethod=syntax

let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" nice file viewer
NeoBundle 'Shougo/unite.vim'

" vimfiler 
NeoBundle 'Shougo/vimfiler.vim'

" show directory tree
NeoBundle 'scrooloose/nerdtree'

" show recently used files with Unite.vim
NeoBundle 'Shougo/neomru.vim'

" syntax checker
NeoBundle 'scrooloose/syntastic.git'

" 
NeoBundle 'The-NERD-Commenter'

" xml plugin
NeoBundle 'sukima/xmledit'

""""""""""""""""""""""""""
" Unite.vim Configurations
""""""""""""""""""""""""""
" start with input mode
let g:unite_enable_start_insert = 1
" buffer view
noremap <C-P> :Unite buffer<CR>
" file list
noremap <C-N> :Unite -buffer-name=file file<CR>
" show recently used files
noremap <C-Z> :Unite file_mru<CR>
" define sources as a directory of currently opened files
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" substitute for esc
noremap <C-l> <esc>
noremap! <C-l> <esc>
map <f12> :!start /min ctags -R .<cr>

" open split window
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" open vsplit window
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" Quit by hitting ESC key twice
au FileType unite nnoremap <silent> <buffer> <expr> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <expr> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""

"""""""""""""""""""""""""""
" Syntastic Configurations
"""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
call neobundle#end()

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

execute pathogen#infect()
" call pathogen#incubate()
call pathogen#infect('bundle/{}')
call pathogen#helptags()

syntax on
filetype plugin indent on
filetype plugin on

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['python']

let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

"""""""""""""""""""
" xmledit settings
"""""""""""""""""""
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

set rtp+=~/.fzf
