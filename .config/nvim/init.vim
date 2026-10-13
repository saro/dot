" New vim-plug based configuration

call plug#begin('~/.config/nvim/plugged')

" *** Bundles to use *** "
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-fugitive'
Plug 'numToStr/Comment.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'saro/MarkKarkat'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/gv.vim'
Plug 'milad14000/vim_p4'
Plug 'skywind3000/asyncrun.vim'
Plug 'adborden/vim-notmuch-address'
Plug 'felipec/notmuch-vim'
Plug 'equalsraf/neovim-gui-shim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'coder/claudecode.nvim'

call plug#end()

let g:barbar_auto_setup = v:false

" *** Gui option ***
set mouse=a

" *** Directory configuration *** "
silent ! mkdir -p ~/tmp/nv/
set dir=~/tmp/nv/
set viminfo+=n~/tmp/nv/viminfo

" *** Alias *** "
ca sss source ~/.config/nvim/init.vim

" *** Set cursor color ***
highlight Cursor guifg=white guibg=#BC6A00
set guicursor=o:block-blinkwait700-blinkoff400-blinkon250-Cursor
set guicursor+=r-cr:hor20-blinkon0-Cursor
set guicursor+=n-v:block-blinkon0-Cursor
set guicursor+=i-c-ci:blinkon0-ver25-Cursor

autocmd TermOpen * nnoremap <buffer> q i<C-c><C-c><C-\><C-n>:q!<CR>

" General Configuration Editor *** "
set encoding=utf-8
set number
set nomodeline
syntax on
set selectmode=mouse
colorscheme jellybeans
set cursorline
set background=dark
set secure exrc
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
let g:grep_params=' '
let g:codeium_enabled = v:false

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
"set guitablabel=\[%N\]\ %t\ %M
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

" *** Key Mapping *** "
cnoreabbrev W w
nnoremap  ; :
vnoremap  ; :

" *** Leader Mapping *** "
vnoremap <leader>y "+y
nnoremap <leader>p "+gp
nnoremap <leader>P "+gP
nnoremap <leader>Y :%y+<CR>

nnoremap <Leader>gs :Git<CR>:resize 20<CR>
nnoremap <Leader>gl :GV<CR>
nnoremap <Leader>gL :GV!<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gd :Gdiffsplit<CR>
nnoremap <Leader>gD :Gdiffsplit 
nnoremap <Leader>gp :copen<CR><C-w>p:AsyncRun git push<CR>
nnoremap <Leader>go :Git checkout -b 
nnoremap <Leader>gc :Git commit --amend -a
nnoremap <Leader>gr :GitGutterUndoHunk<CR>
nnoremap <Leader>gi :vnew<CR>:term glab ci status --compact --live<CR><C-w>H<C-w>u
nnoremap <Leader>gt :new<CR>:term glab ci trace<CR><C-W>J:resize20<CR>

nnoremap <leader>S :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>z 1z=<CR>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>u <C-w>p
nnoremap <leader>v :vs<CR>
nnoremap <leader>w :vertical resize 150<CR>
nnoremap <leader>W <C-w>=

nnoremap <leader>n :call GrepAsync("\"\\<<cword>\\>\"")<CR>
nnoremap <leader>N :call GrepAsync("\"<cword>\"")<CR>
nnoremap <leader>o :call asyncrun#quickfix_toggle(10)<CR>
nnoremap <leader>as :AsyncStop<CR>

nnoremap <leader>cc :ClaudeCode<CR><C-\><C-n><C-w>J:resize 30<CR>i
nnoremap <leader>cr :ClaudeCode --resume<CR><C-\><C-n><C-w>J:resize 30<CR>i
nnoremap <leader>cf :ClaudeCodeFocus<CR>
nnoremap <leader>ca :ClaudeCodeDiffAccept<CR>
nnoremap <leader>cd :ClaudeCodeDiffDeny<CR>
nnoremap <leader>cq :ClaudeCodeClose<CR>
vnoremap <leader>c :ClaudeCodeSend<CR><C-\><C-n><C-w>J:resize 30<CR>i

nnoremap <leader>b :call BuildAsync()<CR>
nnoremap <leader>B :call ReBuildAsync()<CR>

nnoremap <leader>e :Lex<CR>
nnoremap <leader>E :Lex %:p:h<CR>

nnoremap <leader>] <C-]>
nnoremap <leader>[ <C-t>

nnoremap <leader># :b #<CR>
nnoremap <leader>d :<C-U>bprevious <bar> bdelete #<CR>

nnoremap <leader>x :q<CR>
nnoremap <leader>Y :set hlsearch! hlsearch?<CR>
nnoremap <leader>Q :q<CR>
nnoremap <leader>L <Esc>:redraw!<CR>

nnoremap <leader>/ :let @/ = ""<CR>

" *** Windows Resizing ***
nnoremap < :vertical resize -50<CR>
nnoremap > :vertical resize +50<CR>

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
cnoremap <C-v> <c-r>+

" *** Buffer change ***"
imap <C-h> <Esc>:BufferPrevious<CR>
imap <C-l> <Esc>:BufferNext<CR>

vmap <C-h> <Esc>:BufferPrevious<CR>
vmap <C-l> <Esc>:BufferNext<CR>

nmap <C-h> <Esc>:BufferPrevious<CR>
nmap <C-l> <Esc>:BufferNext<CR>

" *** Search and Replace in selection mode ***
vnoremap // y/<C-R>"<CR>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>R "hy:%s/<C-r>h//g<left><left>

map <F1> <nop>
map <F2> <nop>

" *** Terminal keys ***
:tnoremap <C-b> <C-\><C-n>

" Assume CMAKE
let g:build_command="mkdir -p build/ && cd build && cmake ../ && make -j4"
let g:rebuild_command="rm -rf build/* 2>/dev/null; mkdir -p build/ && cd build && cmake ../ && make -j4"

" *** Custom function ***
function! BuildAsync ()
	if exists("b:build_command")
		exec 'AsyncRun  '.b:build_command
	else
		exec 'AsyncRun  '.g:build_command
	endif
endfunction

function! ReBuildAsync ()
	if exists("b:rebuild_command")
		exec 'AsyncRun  '.b:rebuild_command
	else
		exec 'AsyncRun  '.g:rebuild_command
	endif
endfunction

function! GrepAsync (str)
	exec "AsyncRun! -program=grep ".a:str." -i --hidden -g !tags -g !cscope.out -g !.git -g !build ."
	copen
endfunction
command! -nargs=1 Gr call GrepAsync(<f-args>)

" *** Spelling Settings *** "
set spl=en

" *** Fugitive Configuration *** "
function! s:close_gstatus()
	for l:winnr in range(1, winnr('$'))
		if !empty(getwinvar(l:winnr, 'fugitive_status'))
			execute l:winnr.'close'
		endif
	endfor
endfunction
command! GstatusClose call s:close_gstatus()

set diffopt+=vertical
command! GdiffInTab tabedit %|Gdiff
autocmd FileType fugitive vnoremap <buffer> K 10k
autocmd FileType fugitive vnoremap <buffer> J 10j
autocmd FileType fugitive nnoremap <buffer> K 10k
autocmd FileType fugitive nnoremap <buffer> J 10j
autocmd FileType fugitive nnoremap <buffer> cc :GstatusClose<CR>:Git commit<CR>
autocmd FileType fugitive nnoremap <buffer> ca :GstatusClose<CR>:Git commit --amend<CR>
autocmd FileType fugitive nnoremap <buffer> q <C-W>q
autocmd FileType fugitive if expand('%:t') == 'index' | setlocal nobl | endif
autocmd FileType gitcommit wincmd K
autocmd FileType gitcommit set winfixheight
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

" *** QuickFix always in the bottom *** "
autocmd FileType qf wincmd J
autocmd FileType qf nnoremap <buffer> q :q<CR><C-l>
autocmd FileType qf setlocal nobl

" *** Help file *** "
autocmd FileType help nnoremap <buffer> q :q<CR><C-l>

" *** Configurations for ligthline ***
set laststatus=2
let g:lightline = {
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'fullname', 'readonly', 'modified' , 'fugitive' ],
			\             [ 'codeium', 'async' ] ]
			\ },
			\ 'component': {
			\   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
			\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
			\   'fugitive': '%{exists("*fugitive#head")?"[".fugitive#head()."]":""}',
			\   'fullname': '%{expand("%:.")}',
            \   'codeium' : '%{g:codeium_enabled ? "[AI]" : ""}',
			\   'async'   : '%{g:asyncrun_status=="running"?"ASYNC":""}'
			\ },
			\ 'component_visible_condition': {
			\   'readonly': '(&filetype!="help"&& &readonly)',
			\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
			\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
			\   'codeium' : '(g:codeium_enabled && ""!=codeium#GetStatusString())',
			\   'async'   : '(g:asyncrun_status=="running")'
			\ },
			\ }

" *** AsyncRun configuration ***
let g:asyncrun_open=10
let g:asyncrun_save=1

" *** Copilot configuration ***
"let b:copilot_enabled = v:false


" Force copen at the end of the run to fix bug in VIM quickfix error format
" parsing
augroup local-asyncrun
	au!
	au User AsyncRunStop call AfterAsyncBuild()
augroup END

function! AfterAsyncBuild()
	copen
	normal G
	if (g:asyncrun_status == 'success')
		exe "normal \<c-w>p"
	elseif (g:asyncrun_status == 'failure')
		let @/ = "error"
	endif
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

" *** netrw ***
autocmd FileType netrw nnoremap <buffer> q :q!<CR><C-l>
autocmd FileType netrw nnoremap <buffer> q :q!<CR><C-l>
autocmd FileType netrw nnoremap <buffer> q :q!<CR><C-l>
autocmd FileType netrw nnoremap <buffer> qL <CR>
autocmd FileType netrw nnoremap <buffer> qf <CR>
autocmd FileType netrw nnoremap <buffer> qF <CR>
autocmd FileType netrw nnoremap <buffer> qb <CR>
autocmd FileType netrw unmap <buffer> qL
autocmd FileType netrw unmap <buffer> qf
autocmd FileType netrw unmap <buffer> qF
autocmd FileType netrw unmap <buffer> qb
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

" *** Gitlab CI  ***
autocmd FileType yaml let b:build_command="glab ci lint"

" *** JSON ***
autocmd FileType json let b:build_command="cat % | jq empty && echo GOOD JSON"

" *** EMAIL ***
autocmd FileType mail nnoremap <buffer> <leader>b :GrammarousCheck<CR>
autocmd FileType mail nnoremap <buffer> <leader>B :GrammarousReset<CR>

" *** MARKDOWN ***
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal tw=70
let g:markdown_fenced_languages = ['c', 'bash=sh', 'sql', 'html', 'javascript']
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

" *** Set title ***
set title
augroup dirchange
    autocmd!
    autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END

autocmd VimEnter * call s:setup_lua()
function! s:setup_lua() abort
lua require('init')
endfunction
