" New vim-plug based configuration

call plug#begin('~/.config/nvim/plugged')

" *** Bundles to use *** "
Plug 'spf13/vim-colors'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'saro/MarkKarkat'
Plug 'ap/vim-buftabline'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'itchyny/lightline.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/gv.vim'
Plug 'milad14000/vim_p4'
Plug 'skywind3000/asyncrun.vim'
Plug 'adborden/vim-notmuch-address'
Plug 'rhysd/vim-grammarous'
Plug 'equalsraf/neovim-gui-shim'

call plug#end()

" Import shared conf between vimrc and neovim
source ~/.vimrc_common

set mouse=a

" *** Directory configuration *** "
silent ! mkdir -p ~/tmp/nv/
set dir=~/tmp/nv/
set viminfo+=n~/tmp/nv/viminfo

" *** Set cursor color ***
set guicursor=n-v:block-blinkon0-Cursor
set guicursor=o:block-blinkwait700-blinkoff400-blinkon250-Cursor
set guicursor=r-cr:hor20-blinkon0-Cursor
set guicursor+=i-c-ci:blinkon0-ver25-Cursor

