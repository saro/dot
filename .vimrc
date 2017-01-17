" New vim-plug based configuration

call plug#begin('~/.vim/plugged')

" *** Bundles to use *** "
Plug 'spf13/vim-colors'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'hari-rangarajan/CCTree'
Plug 'saro/MarkKarkat'
Plug 'ap/vim-buftabline'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'saro/vim-dezyne'
Plug 'saro/vim-markdown'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" *** Configuration Editor *** "
set encoding=utf-8
set number
syntax on
set selectmode=mouse
set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 10
colorscheme jelleybeans
set cursorline
set background=dark
set exrc
set nowrap
set linebreak
set history=1000
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set hlsearch
set updatetime=400
set tabpagemax=15               " Only show 15 tabs
set wildmode=longest,list
set wildignorecase "Complete filenames (and other stuffs) ignoring case
set ruler                   " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 " Show partial commands in status line and
							" Selected characters/lines in visual mode

" *** Search Option ***
set smartcase
set ignorecase
set wrapscan

" *** Style Option ***
set smartindent
set showtabline=2
set textwidth=80
set noexpandtab
set tabstop=4
set shiftwidth=4

" *** Gui option ***
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guitablabel=\[%N\]\ %t\ %M
set mousehide               " Hide the mouse cursor while typing

" *** Setting warning window ***"
set shortmess+=A

" *** Set Leader key *** "
let mapleader="\<Space>"


" *** Folding settings *** "
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


" *** Directory configuration *** "
silent ! mkdir -p ~/tmp/
set dir=~/tmp/
set viminfo+=n~/tmp/viminfo


" *** Key Mapping *** "
nmap <C-v> "+gp
nmap <C-a> <ESC>ggVG"+y
imap <C-v> <ESC><C-V>i
vmap <C-c> "+y

inoremap <C-S> <Esc>:w<CR>a
nnoremap <C-S> <Esc>:w<CR>
cnoreabbrev W w

nnoremap  ; :
vnoremap  ; :

" *** Leader Mapping *** "
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :GdiffInTab<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gr :GitGutterUndoHunk<CR>
nnoremap <Leader>gD <C-w>h<C-w>c

nnoremap <leader>z 1z=<CR>
nnoremap <leader>l :set hlsearch! hlsearch?<CR>
nnoremap <leader>f :CCTreeTraceForward<CR><CR>
nnoremap <leader>r :CCTreeTraceReverse<CR><CR>

nnoremap <leader>h :AsyncRun! grep -Inri --exclude=tags --exclude=cscope.out --exclude-dir=Obj "\b<C-R><C-W>\b" * .*<CR>:copen<CR>
nnoremap <leader>o :call asyncrun#quickfix_toggle(8)<CR>
nnoremap <leader>s :AsyncStop<CR>

nnoremap <leader>t :Tagbar<CR>

nnoremap <leader>c :CCTreeWindowToggle<CR>

nnoremap <leader>] <C-]>
nnoremap <leader>[ <C-t>

nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader># :b #<CR>
nnoremap <leader>d :BD<CR>

nnoremap <leader>Q :q<CR>

nnoremap <leader>D :Dox<CR>

nnoremap <leader>/ :let @/ = ""<CR>

" *** Windows Resizing ***
nnoremap < :vertical resize +5<CR>
nnoremap > :vertical resize -5<CR>

" *** Moving tricks ??? *** "
map <C-k> <PageUp>
map <C-j> <PageDown>

map K 10k
map J 10j
map H ^
map L $
map <leader>i %

" *** ESC like a boss ***
inoremap jj <Esc>
cnoremap jj <Esc>

" *** Better History navigation ***
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" *** Buffer change ***"
imap <C-h> <Esc>:bprevious!<CR>
imap <C-l> <Esc>:bnext!<CR>

vmap <C-l> <Esc>:bnext!<CR>
vmap <C-h> <Esc>:bprevious!<CR>

nmap <C-l> <Esc>:bnext!<CR>
nmap <C-h> <Esc>:bprevious!<CR>

map <F1> <nop>
map <F2> <nop>

map <F3> <Esc>:Lex<CR>
map <F5> <Esc>:redraw!<CR>

nnoremap <F6> <Esc>:set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
inoremap <F6> <Esc>:set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>i

" *** Alias *** "
"ca tn tabnew
ca gg AsyncRun! grep -Inri --exclude=tags --exclude=cscope.out --exclude-dir=Obj
ca mm Mark
ca sudo w !sudo tee > /dev/null %
ca ss AsyncStop
ca src source ~/.vimrc

" *** Custom function ***
function! GrepAsync (str)
	let tmp = a:str
    exec 'AsyncRun! grep -Inri --exclude=tags --exclude=cscope.out --exclude-dir=Obj '.tmp.' * .*'
	copen
endfunction

command! -nargs=1 G call GrepAsync(<f-args>)

" *** Spelling Settings *** "
set spl=en

" *** GUI specific settings *** "
if has('gui_running')
else
    colorscheme jelleybeans
    set nolist
endif

"*** Create After file ***
silent ! mkdir -p ~/.vim/after/plugin
silent ! echo '" ***THIS IS AUTOMATICALLY GENERATED IN VIMRC ***' > ~/.vim/after/plugin/after.vim

" *** CCTree configuration *** "
let g:CCTreeRecursiveDepth = 1
autocmd BufEnter CCTree-View nnoremap <buffer> <C-l> <nop>
autocmd BufEnter CCTree-View nnoremap <buffer> <C-h> <nop>
autocmd BufEnter CCTree-View nnoremap <buffer> q :q<CR><C-l>
autocmd BufEnter CCTree-View nnoremap <buffer> + :CCTreeRecurseDepthPlus<CR>
autocmd BufEnter CCTree-View nnoremap <buffer> - :CCTreeRecurseDepthMinus<CR>


" *** Fugitive Configuration *** "
set diffopt+=vertical
command! GdiffInTab tabedit %|Gdiff
autocmd FileType gitcommit nnoremap <buffer> <C-l> <nop>
autocmd FileType gitcommit nnoremap <buffer> <C-h> <nop>
autocmd FileType gitcommit if expand('%:t') == 'index' | setlocal nobl | endif
autocmd BufEnter COMMIT_EDITMSG setlocal spell


" *** GitGutter Configuration ***
let g:gitgutter_async = 0
silent ! echo 'unmap <leader>hp' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>hr' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>hu' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>hs' >> ~/.vim/after/plugin/after.vim


" *** TagBar configuration *** "
autocmd FileType tagbar setlocal nocursorline nocursorcolumn
autocmd FileType tagbar nnoremap <buffer> <C-l> <nop>
autocmd FileType tagbar nnoremap <buffer> <C-h> <nop>


" *** QuickFix always in the bottom *** "
autocmd FileType qf wincmd J
autocmd FileType qf nnoremap <buffer> q :q<CR><C-l>
autocmd FileType qf setlocal nobl
autocmd FileType qf nnoremap <buffer> <C-l> <nop>
autocmd FileType qf nnoremap <buffer> <C-h> <nop>
autocmd FileType qf nnoremap <leader>o :call asyncrun#quickfix_toggle(8)<CR>


" *** Help file *** "
autocmd FileType help nnoremap <buffer> q :q<CR><C-l>
autocmd FileType help nnoremap <buffer> <C-l> <nop>
autocmd FileType help nnoremap <buffer> <C-h> <nop>
autocmd FileType help nnoremap <buffer> <C-l> <nop>
autocmd FileType help nnoremap <buffer> <C-h> <nop>


" *** Configurations for ligthline ***
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'readonly', 'modified' ],
      \             [ 'fugitive', 'async' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"x":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'async'   : '%{g:asyncrun_status=="running"?"ASYNC":""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \   'async'   : '(g:asyncrun_status=="running")'
      \ },
\ }

" *** Asyncrun con configuration ***
" let g:asyncrun_trim = 1

" *** Configuration for Gutentags ***
" let gutentags_generate_on_missing=0
" let gutentags_auto_set_tags=0
" set statusline+=%{gutentags#statusline()}
let g:gutentags_enabled_user_func = 'CheckEnabledDirs'
let g:gutentags_create_tags = 0

function! CheckEnabledDirs(file)
    let file_path = fnamemodify(a:file, ':p:h')

    try
        let gutentags_root = gutentags#get_project_root(file_path)
        if filereadable(gutentags_root . '/.withtags')
            return 1
        endif
    catch
    endtry

    " Set this value to 1 to enable the tags creation "
    if g:gutentags_create_tags == 1
        return 1
    endif

    return 0
endfunction


" *** Mark plugin configuration ***
let g:mwDefaultHighlightingPalette = 'extended'
nmap <C-A-F12>a <Plug>MarkSearchCurrentPrev
nmap <C-A-F12>b <Plug>MarkSearchAnyNext
nmap <C-A-F12>c <Plug>MarkRegex
nmap <C-A-F12>d <Plug>MarkClear
nmap <C-A-F12>e <Plug>MarkSearchCurrentNext
nmap <C-A-F12>f <Plug>MarkSearchAnyPrev


" *** BuffKill unmap undesired keys combination ***
silent ! echo 'unmap <leader>ba' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>bundo' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>\!bw' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>bw' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>\!bd' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>bd' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>\!bun' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>bun' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>bf' >> ~/.vim/after/plugin/after.vim
silent ! echo 'unmap <leader>bb' >> ~/.vim/after/plugin/after.vim


"*** Buftabline ***"
" Activate indicators
let g:buftabline_indicators=1
" Activate numbers
let g:buftabline_numbers=1
" Activate separators
let g:buftabline_separators=1


" *** netrw ***
" autocmd FileType netrw nnoremap <buffer> <F1> <nop>
" autocmd FileType netrw nnoremap <buffer> <F2> <nop>
autocmd FileType netrw nnoremap <buffer> <C-l> <nop>
autocmd FileType netrw nnoremap <buffer> <C-h> <nop>
autocmd FileType netrw unmap <buffer> qL
autocmd FileType netrw unmap <buffer> qF
autocmd FileType netrw unmap <buffer> qf
autocmd FileType netrw unmap <buffer> qb
autocmd FileType netrw nnoremap <buffer> q :q<CR><C-l>
autocmd FileType netrw nnoremap <buffer> <F3> :q<CR><C-l>
let g:netrw_altv=1
let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_winsize = -25
let g:netrw_browse_split = 4
let g:netrw_bufsettings = 'noma nomod nobl nonu nowrap ro'

" *** FILE TYPES SETTINGS ***
" *** MARKDOWN ***
autocmd FileType markdown setlocal expandtab
let g:markdown_fenced_languages = ['c', 'bash=sh']
let g:markdown_syntax_conceal = 0

" *** VIM FILES ***
autocmd FileType vim setlocal fileformat=unix
autocmd FileType vim setlocal expandtab

" *** PASS FILE PROTECTION ***
" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
                    \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                    \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
                    \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                    \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                        \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                        \ setlocal viminfo=
        augroup END
    endif
endif

" *** Set cursor color ***
highlight Cursor guifg=white guibg=#BC6A00