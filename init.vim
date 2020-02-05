" Environment requirements:
" - nvim
" - python3
" - vim plug
" - node

" Auto load for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

  " Pretty Dress
  Plug 'vim-airline/vim-airline'
  
  " Auto Complete
  " Can ues `:checkhealth` command to see if coc services is running
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Defx File Explorer
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
  Plug 'kristijanhusak/defx-git'

  " fzf
  Plug '/usr/local/opt/fzf'
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'

  " Track the engine.
  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

call plug#end()

set shell=zsh

" Default options
set autoread " Automatically read the file when it's changed outside VIM
set cursorline " Enable current line indicator
set encoding=UTF-8 " Default file encoding
set expandtab " To Insert a real tab on insert mode
set history=10000 " The lines of history to remember
set lazyredraw " Don't redraw while performing a macro
set noautochdir " Don't change the current working directory whenever open a file, switch buffer, delete a buffer or open/close a window.
set number " Show line numbers
set relativenumber
set ruler " Always show current position
set showcmd " 
set showmatch " Show matching braces
set splitbelow splitright
set ttimeoutlen=50
set undofile " Enable undo persistence across sessions
set wrap

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Indent
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Syntax
if !exists('g:syntax_on')
	syntax enable
endif

set wildignore+=.git,.DS_Store

exec "nohlsearch"

" Basic Mappings
"| key   | mean         | 
"|-------|--------------| 
"| nore  | no recursion |
"| n     | normal mode  |
"| v     | visual mode  |
"| i     | insert mode  |
"| c     | command mode |
"| map   | recursion map|
"| unmap | delete map   |
" 
" Know more: https://neovim.io/doc/user/map.html
" 
let mapleader=" "
"map ; :

" Save & quit
map S :w<CR>
map Q :q<CR>

" Search
noremap = nzz
noremap - Nzz
map <LEADER><CR> :nohlsearch<CR>

" Cursor Movement
noremap K 5k
noremap J 5j

" Windows management
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h

" Disabling the default 's' key
map s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitright<CR>:split<CR>
map sk :set nosplitright<CR>:split<CR>

" Resize splits with arrow keys
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

" Press <LEADER> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" Tab management
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

" Other useful stuff
" \p to show the current buffer file path
nnoremap \p 1<C-G>

" Opening a terminal window
noremap <LEADER>/ :term<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" find and replace
noremap \s :%s//g<left><left>

" easy system clipboard copy/paste
noremap <LEADER>y "*y
noremap <LEADER>Y "*Y
noremap <LEADER>p "*p
noremap <LEADER>P "*P

" Compile function
map r :call ComplieRunGcc()<CR>
func! ComplieRunGcc()
  exec "w"
  if &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
  endif
endfunc

" My snippits
source ~/.config/nvim/snippits.vim


" Defx
call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_mappings()
function! s:defx_mappings() abort
  setl nospell
  setl nonumber
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
  " 打开或关闭文件夹
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  " 显示隐藏文件
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

" Defx icons
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1

" Defx git
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" fzf
noremap <LEADER>f :FZF<CR>
noremap <LEADER>b :Buffers<CR>
"noremap <LEADER>h :History<CR>

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
