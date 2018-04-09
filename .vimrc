filetype off
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'w0rp/ale'
Plug 'mattn/webapi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
"Plug 'klen/python-mode'
Plug 'altercation/vim-colors-solarized'
Plug 'shougo/neocomplete.vim', {'for': ['rust', 'python', 'c', 'cpp', 'js', 'java']}

Plug 'racer-rust/vim-racer'
Plug 'powerline/powerline'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/c.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'Valloric/YouCompleteMe', {'for': ['rust', 'python', 'c', 'cpp', 'js', 'java']}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippetsRust'
Plug 'ryanoasis/vim-devicons'
"Plugin 'junegunn/limelight.vim'
call plug#end()
filetype plugin indent on
filetype plugin on


function! OpenCurrentAsNewTab()
  let l:currentPos = getcurpos()
  tabedit %
  call setpos(".", l:currentPos)
endfunction
nnoremap <C-W>T :call OpenCurrentAsNewTab()<CR>
nnoremap <C-W>t :tabclose<CR>

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set viminfo=
set cryptmethod=blowfish2
set hidden
set nocompatible
set scrolloff=3
set wildmenu
set foldlevel=99
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

"for learning purposes (remove arrow keys)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
"

"lose help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"for faster stuff
nnoremap ; :

let mapleader=","
"lose all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
let g:EasyMotion_do_mapping = 0 
let g:racer_cmd = "/home/luka/.cargo/bin/racer"

"Vimtex config
let g:vimtex_view_method = 'zathura'

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
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
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
nmap <F3> :NERDTreeTabsToggle<CR>
"hide nerd tree
imap <F2> <ESC>:NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>
"comments
nmap <C-c> <Plug>NERDCommenterInvert

"paste to clipboard
xmap <C-c> "+y<CR>
"autocmpl on tab 
"inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<tab>"
"autocmd Filetype c,cpp,python imap . .<C-x><C-o>

"imap / /<C-x><C-f>
highlight ColorColumn ctermbg=7
syntax enable
syntax on

colorscheme gruvbox

" Makes the background transparent. Leave these out if you're not using a transparent
" terminal.
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

set termguicolors
set background=dark

"YCM complete me settings
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycmp_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_auto_trigger= 0
let g:ycm_filetype_whitelist = { 'rust': 1, 'python': 1, 'c': 1}
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'rust' : ['::', '.'],
  \ }
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!!'
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_use_ultisnips_completer = 1

"ultisnips settings
let g:UltiSnipsEditSplit="vertical"

" for completion
"inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
"inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
inoremap <expr> <TAB> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<cr>"  : "<TAB>"

" Rust settings
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -sel clip'

" Syntastic checker
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:sytastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_rust_checkers = ['cargo rustc']
" ALE config
let g:ale_fixers = {
      \ 'c': ['gcc', 'clang-format'],
      \ 'rust': ['rustc'],
      \ 'python': ['flake8'],
      \ 'bash': ['shellcheck'],
      \ 'ansible': ['ansible-lint'],
 \}

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

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Python mode
"let g:pymode_python='python3'

" for python files
autocmd BufNewFile,BufRead *.py 
			\set tabstop=4 | 
			\set softtabstop=4 |
			\set shiftwidth=4 |
			\set textwidth=80 |
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

autocmd BufNewFile,BufRead *.{js,html,css} set tabstop=2 |
			\set softtabstop=2 |
			\set shiftwidth=2

