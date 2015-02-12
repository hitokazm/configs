set nocompatible
set runtimepath+=~/.vim_runtime
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set rtp+=~/.fzf
set history=200

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

execute pathogen#infect()
syntax on
filetype plugin indent on

filetype plugin on

