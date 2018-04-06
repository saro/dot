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
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/gv.vim'
Plug 'milad14000/vim_p4'

call plug#end()

" *** Configuration Editor *** "
set encoding=utf-8
set number
syntax on
set selectmode=mouse
" set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 10
set guifont=Share\ Tech\ Mono\ 10
colorscheme jelleybeans
set cursorline
set background=dark
set exrc
set nowrap
set linebreak
set history=1000
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set updatetime=400
set tabpagemax=15 " Only show 15 tabs
set wildmode=longest,list
set wildignorecase "Complete filenames (and other stuffs) ignoring case
set ruler " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd " Show partial commands in status line and selected characters/lines in visual mode
set scrolloff=1
set sidescrolloff=4
set complete=.,w,b,u,t
set cm=blowfish2
let g:grep_params=' '
" let g:grep_params='--exclude=tags --exclude=cscope.out --exclude-dir=build'

" *** Search Option ***
set smartcase
set ignorecase
set wrapscan
set hlsearch
set incsearch

" *** Autocompletion case sensitive ***
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase
au InsertLeave * set smartcase

" *** Style Option ***
set smartindent
set showtabline=2
set textwidth=0
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
nnoremap <Leader>gl :GV<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gc :Git checkout -b 
nnoremap <Leader>gr :GitGutterUndoHunk<CR>
nnoremap <Leader>gD <C-w>h<C-w>c

nnoremap <leader>s :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
nnoremap <leader>z 1z=<CR>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>u <C-w>p
nnoremap <leader>w :vertical resize 125<CR>

nnoremap <leader>n :call GrepAsync('"\b<cword>\b"')<CR>
nnoremap <leader>N :call GrepSync('"\b<cword>\b"')<CR>
nnoremap <leader>o :call asyncrun#quickfix_toggle(8)<CR>
nnoremap <leader>as :AsyncStop<CR>
nnoremap <leader>am :AsyncRun -program=make<CR>
nnoremap <leader>ac :AsyncRun! shellcheck -f gcc %<CR>

nnoremap <leader>t :Tagbar<CR>
nnoremap <leader>e :Lex<CR>
nnoremap <leader>E :Lex %:p:h<CR>

nnoremap <leader>cc :CCTreeWindowToggle<CR>
nnoremap <leader>cf :CCTreeTraceForward<CR><CR>
nnoremap <leader>cr :CCTreeTraceReverse<CR><CR>

nnoremap <leader>] <C-]>
nnoremap <leader>[ <C-t>

nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader># :b #<CR>
nnoremap <leader>d :BD<CR>

nnoremap <leader>x :q<CR>
nnoremap <leader>Y :set hlsearch! hlsearch?<CR>
nnoremap <leader>Q :q<CR>
nnoremap <leader>L <Esc>:redraw!<CR>
nnoremap <leader>D :Dox<CR>

nnoremap <leader>/ :let @/ = ""<CR>

" *** Windows Resizing ***
nnoremap < :vertical resize +5<CR>
nnoremap > :vertical resize -5<CR>

" *** disable visual mode ***
nnoremap <S-q> <nop>

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
cnoremap jj <C-C><Esc>

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

" *** Search in selection mode ***
vnoremap // y/<C-R>"<CR>

map <F1> <nop>
map <F2> <nop>

" map <F3> <Esc>:Lex<CR>

" *** Alias *** "
" ca tn tabnew
" ca gg AsyncRun! grep -Inri --exclude=tags --exclude=cscope.out --exclude-dir=Obj
" ca mm Mark
" ca sudo w !sudo tee > /dev/null %
" ca ss AsyncStop
" ca src source ~/.vimrc

" *** Custom function ***
function! GrepAsync (str)
	exec 'AsyncRun! grep -Irni --exclude=tags --exclude=cscope.out '.g:grep_params.' '.a:str.' .'
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
" let g:gitgutter_async = 1
" let g:gitgutter_realtime = 1
let g:gitgutter_map_keys = 0
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk


" *** TagBar configuration *** "
autocmd FileType tagbar setlocal nocursorline nocursorcolumn
autocmd FileType tagbar nnoremap <buffer> <C-l> <nop>
autocmd FileType tagbar nnoremap <buffer> <C-h> <nop>
autocmd FileType tagbar nnoremap <buffer> <Space> <nop>
autocmd FileType tagbar nnoremap <buffer> <leader>h <C-w>h
autocmd FileType tagbar nnoremap <buffer> <leader>j <C-w>j
autocmd FileType tagbar nnoremap <buffer> <leader>k <C-w>k
autocmd FileType tagbar nnoremap <buffer> <leader>l <C-w>l


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

" *** Configuration for polyglot *** "
" let g:polyglot_disabled = ['typescript']
" autocmd FileType typescript let current_compiler="saro"


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

" *** AsyncRun configuration ***
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" let g:asyncrun_trim = 1

" *** Configuration for Gutentags ***
" let gutentags_generate_on_missing=0
" let gutentags_auto_set_tags=0
" set statusline+=%{gutentags#statusline()}
let g:gutentags_enabled_user_func = 'CheckEnabledDirs'
let g:gutentags_create_tags = 0

function! CheckEnabledDirs(file)
	let file_path = fnamemodify(a:file, ':p:h')
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


" *** vim-commentary ***
autocmd FileType cmake setlocal commentstring=#\ %s

"*** Buftabline ***"
" Activate indicators
let g:buftabline_indicators=1
" Activate numbers
let g:buftabline_numbers=1
" Activate separators
let g:buftabline_separators=1


" *** netrw ***
autocmd FileType netrw nnoremap <buffer> <C-l> <nop>
autocmd FileType netrw nnoremap <buffer> <C-h> <nop>
autocmd FileType netrw unmap <buffer> qL
autocmd FileType netrw unmap <buffer> qF
autocmd FileType netrw unmap <buffer> qf
autocmd FileType netrw unmap <buffer> qb
autocmd FileType netrw nnoremap <buffer> q :q!<CR><C-l>
autocmd FileType netrw nnoremap <buffer> <leader>e :q!<CR><C-l>
let g:netrw_altv=1
let g:netrw_banner = 0
let g:netrw_liststyle=0
let g:netrw_winsize = -25
let g:netrw_browse_split = 4
let g:netrw_bufsettings = 'noma nomod nobl nonu nowrap ro'

" *** FILE TYPES SETTINGS ***
" *** MARKDOWN ***
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal tw=0
let g:markdown_fenced_languages = ['c', 'bash=sh']
let g:markdown_syntax_conceal = 0

" *** C ***
autocmd FileType c setlocal tw=80
autocmd FileType c match ErrorMsg '\s\+$'
autocmd FileType c match ErrorMsg '\%>80v.\+'

" *** C++ ***
autocmd FileType cpp setlocal tw=80
autocmd FileType cpp match ErrorMsg '\s\+$'
autocmd FileType cpp match ErrorMsg '\%>120v.\+'

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
