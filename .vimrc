filetype off
call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'keremc/asyncomplete-racer.vim', { 'for': 'rust' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'shougo/deoplete.nvim', {'for': ['latex','tex']}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'lervag/vimtex', {'for': ['latex', 'tex'] }
"Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim', { 'for': ['python'] }
Plug 'w0rp/ale', {'for': ['rust', 'python', 'c', 'cpp', 'bash', 'latex', 'tex'] }
"Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"Plug 'zxqfl/tabnine-vim', { 'for': 'rust' }
Plug 'altercation/vim-colors-solarized'

Plug 'racer-rust/vim-racer', { 'for': 'rust' }
"Plug 'powerline/powerline'
"Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/c.vim', { 'for': 'c' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippetsRust'
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeTabsToggle' }
"Plugin 'junegunn/limelight.vim'
call plug#end()
filetype plugin indent on
filetype plugin on
" Polyglot disable latex
let g:polyglot_disabled = ["tex", "latex"]


function! OpenCurrentAsNewTab()
  let l:currentPos = getcurpos()
  tabedit %
  call setpos(".", l:currentPos)
endfunction
nnoremap <C-W>T :call OpenCurrentAsNewTab()<CR>
nnoremap <C-W>t :tabclose<CR>

colorscheme gruvbox
set laststatus=2
set t_Co=256
set viminfo=
set cryptmethod=blowfish2
set hidden
set nocompatible
set scrolloff=3
set wildmenu
"set wildmode=list:longest
set enc=utf-8
set encoding=utf8
set fenc=utf-8
set guifont=DrodSansMono\ Nerd\ Font\ 11
set termencoding=utf-8
set smartindent
set ttyfast
set ruler
set textwidth=120
"set t_Co=256
set foldmethod=indent
set mouse=a
nnoremap <space> za
set mousehide
set backup
set timeoutlen=1000 ttimeoutlen=0
set writebackup
set relativenumber
set nocp
set shiftwidth=4
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set colorcolumn=120
set completeopt=longest,menuone,preview
set comments=sl:/*,mb:\ *,elx:\ */
set tabstop=8 softtabstop=0 noexpandtab shiftwidth=0
set splitbelow
set splitright

"lose help
inoremap <F1> <ESC>"=strftime("%b %d, %Y")<CR>P
nnoremap <F1> "=strftime("%b %d, %Y")<CR>P
vnoremap <F1> <ESC>"=strftime("%b %d, %Y")<CR>P

" Disable EX mode
map Q <Nop>
"for faster stuff
" nnoremap ; :

let mapleader=","
"lose all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
let g:racer_cmd = "/home/luka/.cargo/bin/racer"

"Vimtex config
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let g:vimtex_view_method = 'mupdf'
let g:tex_flavor = 'latex'

"move to split window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"better regex search
nnoremap / /\v
vnoremap / /\v
"clear search
nnoremap <leader><space> :noh<cr>
"for brackets and stuff
nnoremap <tab> %
vnoremap <tab> %
"find words starting with first two chars
" nmap s <Plug>(easymotion-overwin-f)
" nmap s <Plug>(easymotion-overwin-f2)
"run make with F3
nmap <F3> :make<CR>		
imap <F3> <ESC>:make<CR>

"run make clean with F4
nmap <F4> :make clean<CR>
imap <F4> <ESC>:make clean<CR>

"call togglebg#map("<F5>")

"backup files
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

"nerd tree
nmap <F2> :NERDTreeTabsToggle<CR>
"hide nerd tree
imap <F2> <ESC>:NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>
"comments
nmap <C-c> <Plug>NERDCommenterInvert

"paste to clipboard
xmap <C-c> "+y<CR>

"imap / /<C-x><C-f>
highlight ColorColumn ctermbg=7
syntax enable
syntax on


" Makes the background transparent. Leave these out if you're not using a transparent
" terminal.
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

set termguicolors
set background=dark


" for completion
"inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
"inoremap <expr> k pumvisible() ? "\<C-p>" : "k"

" LSP settings
let g:LanguageClient_serverCommands = {
			\ 'c': ['clangd', 'ccls', 'cquery'],
			\ 'python': ['pyls'],
			\ 'rust': ['rustup', 'run', 'stable', 'rls'] }


" Rust settings
let g:autofmt_autosave = 1
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -sel clip'

let g:LaguageClient_autoStart = 1

" Airline
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#vimtex#enabled=1
let g:airline#extensions#ale#enabled=1


" ALE config
let g:ale_completion_enabled = 0
let g:ale_fixers = {
      \ 'rust': ['rustfmt'],
      \ 'python': ['black'],
      \ 'bash': ['shellcheck'],
      \ 'ansible': ['ansible-lint'],
 \}

let g:ale_fix_on_save = 1
let g:ale_linters = {
	\ 'tex': ['/opt/Git/pplatex/build/src/pplatex'],
	\ 'latex': ['/opt/Git/pplatex/build/src/pplatex'],
	\ 'python': ['pyflakes', 'mypy', 'pycodestyle', 'pydocstyle'],
	\ 'rust': ['rls', 'cargo', 'rustc'],
\}
let g:ale_list_window_size = 5
let g:ale_sign_column_always = 1
let g:ale_sign_warning = "!!"
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_linters = {
			"\ 'rust': ['rls'],
			"\}
let g:ale_rust_rls_toolchain = "stable"

" Tagbar config
nmap <F8> :Tagbar<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" Vim-devicons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 0
let g:WebDevIconsOS = 'Linux'

" Python black
"let g:black_fast = 0
"let g:black_linelength = 88


" Python mode
"let g:pymode_python='python3'

" for rust files
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
" for python files
autocmd BufNewFile,BufRead *.py 
			\set tabstop=4 | 
			\set softtabstop=4 |
			\set shiftwidth=4 |
			\set textwidth=79 |
			\set expandtab |
			\set autoindent |
			\set fileformat=unix

au BufNewFile,BufRead *.c set tabstop=8 |
			\set softtabstop=0 |
			\set shiftwidth=0 |
			\set textwidth=80 |
			\set noexpandtab |
			\set autoindent |
			\set fileformat=unix

au FocusLost,WinLeave,BufLeave *  silent! up

autocmd BufNewFile,BufRead *.js, *.html, *.css
			\set tabstop=2
			\set softtabstop=2
			\set shiftwidth=2


" cheat.sh conf
let g:CheatSheetUrlSettings='q'

" Asyncomplete
" Tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust', 'rs'],
        \ })
endif

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('pyflakes')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyflakes',
        \ 'cmd': {server_info->['pyflakes']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

" Asyncomplete-file
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
" Codi
let g:codi#interpreters = {
	\ 'python': {
		\ 'bin': 'python3',
		\ 'prompt': '^\(>>>\|\.\.\.\)',
		\ },
	\ }


" Fzf config
nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>
let g:fzf_buffers_jump = 1
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'left': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Virtualenv python
