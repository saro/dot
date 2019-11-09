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
Plug 'adborden/vim-notmuch-address'

call plug#end()

" *** Configuration Editor *** "
set encoding=utf-8
set number
set nomodeline
syntax on
set selectmode=mouse
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
let g:build_command='make'
let g:rebuild_command='make'

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
cnoreabbrev W w

nnoremap  ; :
vnoremap  ; :

" *** Leader Mapping *** "
vnoremap <leader>y "+y
nnoremap <leader>p "+gp
nnoremap <leader>P "+gP
nnoremap <leader>a :%y+<CR>

nnoremap <Leader>gs :10Gstatus<CR>
nnoremap <Leader>gl :GV<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiffsplit<CR>
nnoremap <Leader>gp :copen<CR><C-w>p:Gpush<CR>
nnoremap <Leader>go :Git checkout -b 
nnoremap <Leader>gc :Gcommit --amend -a
nnoremap <Leader>gr :GitGutterUndoHunk<CR>

nnoremap <Leader>c :Commentary<CR>
vnoremap <Leader>c :Commentary<CR>

nnoremap <leader>S :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>z 1z=<CR>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>u <C-w>p
nnoremap <leader>v :vs<CR>
nnoremap <leader>w :vertical resize 125<CR>
nnoremap <leader>W <C-w>=

nnoremap <leader>n :call GrepAsync('"\b<cword>\b"')<CR>
nnoremap <leader>N :call GrepAsync('"<cword>"')<CR>
nnoremap <leader>o :call asyncrun#quickfix_toggle(8)<CR>
nnoremap <leader>as :AsyncStop<CR>
nnoremap <leader>b :call BuildAsync()<CR>
nnoremap <leader>B :call ReBuildAsync()<CR>

nnoremap <leader>t :Tagbar<CR>
nnoremap <leader>e :Lex<CR>
nnoremap <leader>E :Lex %:p:h<CR>

nnoremap <leader>] <C-]>
nnoremap <leader>[ <C-t>

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

" *** Search and Replace in selection mode ***
vnoremap // y/<C-R>"<CR>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>R "hy:%s/<C-r>h//g<left><left>

map <F1> <nop>
map <F2> <nop>

" *** Alias *** "
ca sss source ~/.vimrc

" *** Custom function ***
function! BuildAsync ()
	let @/ = "error"
	if exists("b:build_command")
		exec 'AsyncRun  '.b:build_command
	else
		exec 'AsyncRun  '.g:build_command
	endif
endfunction

function! ReBuildAsync ()
	let @/ = "error"
	if exists("b:rebuild_command")
		exec 'AsyncRun  '.b:rebuild_command
	else
		exec 'AsyncRun  '.g:rebuild_command
	endif
endfunction

function! GrepAsync (str)
	exec 'AsyncRun! -program=grep --exclude=tags --exclude=cscope.out --exclude-dir=.git -R -I -i '.g:grep_params.' '.a:str.' .'
	copen
endfunction
command! -nargs=1 G call GrepAsync(<f-args>)
autocmd! User Fugitive command! -buffer -nargs=1 G call GrepAsync(<f-args>)

" *** Spelling Settings *** "
set spl=en

if has('gui_running')
    " *** GUI specific settings *** "
else
    " *** TERM specific settings *** "
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
autocmd FileType fugitive nnoremap <buffer> <C-l> <nop>
autocmd FileType fugitive nnoremap <buffer> <C-h> <nop>
autocmd FileType fugitive vnoremap <buffer> K 10k
autocmd FileType fugitive vnoremap <buffer> J 10j
autocmd FileType fugitive nnoremap <buffer> K 10k
autocmd FileType fugitive nnoremap <buffer> J 10j
autocmd FileType fugitive nnoremap <buffer> q <C-W>q
autocmd FileType fugitive if expand('%:t') == 'index' | setlocal nobl | endif
autocmd FileType gitcommit nnoremap <buffer> <C-l> <nop>
autocmd FileType gitcommit nnoremap <buffer> <C-h> <nop>
autocmd FileType gitcommit if expand('%:t') == 'index' | setlocal nobl | endif
autocmd BufEnter COMMIT_EDITMSG setlocal spell


" *** GitGutter Configuration ***
" let g:gitgutter_async = 1
" let g:gitgutter_realtime = 1
let g:gitgutter_map_keys = 0
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

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
let g:csv_no_conceal = 1
let g:no_csv_maps = 1

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
let g:asyncrun_open=10
let g:asyncrun_save=1
" let g:asyncrun_exit="exec 'silent !notify-send VIM-MAKE:'.g:asyncrun_status.''"

" *** Configuration for Gutentags ***
" let gutentags_generate_on_missing=0
" let gutentags_auto_set_tags=0
" set statusline+=%{gutentags#statusline()}
let g:gutentags_enabled_user_func = 'CheckEnabledDirs'
let g:gutentags_create_tags = 0

function! CheckEnabledDirs(file)
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
nmap <C-A-F12>g <Plug>MarkRegex
xmap <C-A-F12>g <Plug>MarkRegex
nmap <C-A-F12>h <Plug>MarkClear


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

" *** CLAN_COMPLETE ***
" let g:clang_library_path='/usr/lib/'

" *** netrw ***
autocmd FileType netrw nnoremap <buffer> <C-l> <nop>
autocmd FileType netrw nnoremap <buffer> <C-h> <nop>
autocmd FileType netrw nnoremap <buffer> q :q!<CR><C-l>
autocmd FileType netrw nnoremap <buffer> <leader>e :q!<CR><C-l>
let g:netrw_altv=1
let g:netrw_banner = 0
let g:netrw_liststyle=0
let g:netrw_winsize = -25
let g:netrw_browse_split = 4
let g:netrw_bufsettings = 'noma nomod nobl nonu nowrap ro'

" *** FILE TYPES SETTINGS ***
" *** BASH/SH ***
autocmd FileType bash,sh let b:build_command="shellcheck -f gcc %"

" *** MARKDOWN ***
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal tw=100
let g:markdown_fenced_languages = ['c', 'bash=sh']
let g:markdown_syntax_conceal = 0

" *** C ***
autocmd FileType c setlocal tw=80
autocmd FileType c setlocal tabstop=8
autocmd FileType c setlocal shiftwidth=8
autocmd FileType c setlocal softtabstop=8

" *** C++ ***
autocmd FileType cpp setlocal tw=120
autocmd FileType cpp setlocal tabstop=4
autocmd FileType cpp setlocal shiftwidth=4
autocmd FileType cpp setlocal softtabstop=4

" *** HTML ***
autocmd FileType html setlocal tw=0
autocmd FileType html setlocal cursorcolumn
autocmd FileType html setlocal expandtab

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

" *** Better buftabs ***
highlight TabLineSel guifg=white guibg=#BC6A00 gui=bold cterm=bold
highlight TabLine guifg=black guibg=#B0B8C0 gui=none cterm=none
