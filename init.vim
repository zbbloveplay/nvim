


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=" "
syntax on

" ==
" == Editor behavior
" ==
set number
"set relativenumber
set cursorline
set expandtab
set wrap
set showcmd
set tabstop=2
set shiftwidth=2
set softtabstop=2

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" ==
" == Basic Mappings
" ==
let mapleader=" "
"map ; :

" Save & quit
map S :w<CR>
map Q :q<CR>

" Search
noremap = nzz
noremap - Nzz
map <LEADER><CR> :nohlsearch<CR>

" ===
" === Cursor Movement
" ===
noremap K 5k
noremap J 5j

" ===
" === Windows management
" ===
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h

" Disabling the default 's' key
map s <nop>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitright<CR>:split<CR>
map sk :set nosplitright<CR>:split<CR>

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>


map tu :tabe<CR>

" My snippits
source ~/.config/nvim/snippits.vim


call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown','vim-plug'] }

" xkbswitch
Plug 'lyokha/vim-xkbswitch'

call plug#end()

" xkbswitch
let g:XkbSwitchEnabled = 1
" ===
" === Markdown Preview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" Compile function
map r :call ComplieRunGcc()<CR>
func! ComplieRunGcc()
  exec "w"
  if &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc


