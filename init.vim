" Environment requirements:
" - nvim > 4(float window) 
" - python3
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
  Plug 'vim-airline/vim-airline-themes'
  
  " Defx File Explorer
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
  Plug 'kristijanhusak/defx-git'

  " translator
  Plug 'voldikss/vim-translator'

  " fzf
  "Plug '/usr/local/opt/fzf'
  "Plug '~/.fzf'
  "Plug 'junegunn/fzf.vim'

  " Auto Complete
  " Can ues `:checkhealth` command to see if coc services is running
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Ultisnips
  "Plug 'SirVer/ultisnips'
  " Snippets are separated from the engine. Add this if you want them:
  "Plug 'honza/vim-snippets'

  " Golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Default options
set shell=zsh
set autoread " Automatically read the file when it's changed outside VIM
set cursorline " Enable current line indicator
set encoding=UTF-8 " Default file encoding
set expandtab " To Insert a real tab on insert mode
set history=10000 " The lines of history to remember
"set lazyredraw " Don't redraw while performing a macro
set noautochdir " Don't change the current working directory whenever open a file, switch buffer, delete a buffer or open/close a window.
set number " Show line numbers
set ruler " Always show current position
set showcmd 
set showmatch " Show matching braces
set splitbelow splitright
set ttimeoutlen=20
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
" Know more: https://neovim.io/doc/user/map.html
"let mapleader=" "

" Save & quit
map S :w<CR>
map Q :q<CR>

" Quick Cursor Movement
noremap K 5k
noremap J 5j
noremap L 5l
noremap H 5h

" Windows management
"nnoremap <space>j <C-w>j
"nnoremap <space>k <C-w>k
"nnoremap <space>l <C-w>l
"nnoremap <space>h <C-w>h

" Disabling the default 's' key
"map s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sj :set splitright<CR>:split<CR>
nnoremap sk :set nosplitright<CR>:split<CR>

" Resize splits with arrow keys
nnoremap <up> :res -5<CR>
nnoremap <down> :res +5<CR>
nnoremap <left> :vertical resize+5<CR>
nnoremap <right> :vertical resize-5<CR>

" Tab management
" Create a new tab with tu
"noremap tu :tabe<CR>
"" Move around tabs with tn and ti
"noremap tn :-tabnext<CR>
"noremap ti :+tabnext<CR>
"" Move the tabs with tmn and tmi
"noremap tmn :-tabmove<CR>
"noremap tmi :+tabmove<CR>

" Other useful stuff
" \p to show the current buffer file path
nnoremap \p 1<C-G>

" find and replace
noremap \s :%s//g<left><left>

" Opening a terminal window
noremap \t :term<CR>

" No highlighting serch result
noremap \<CR> :nohlsearch<CR>

" Toggle number 
function! RelativeNumberToggle()
	if(&relativenumber == 0)
		set relativenumber
	else
		set norelativenumber
	endif
endfunc
noremap \n :call RelativeNumberToggle()<cr>

" Press <SPACE> + q to close the window below the current window
"nnoremap <SPACE>q <C-w>j:q<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee > /dev/null %

" easy system clipboard copy/paste
"nnoremap <SPACE>y "*y
"nnoremap <SPACE>Y "*Y
"nnoremap <SPACE>p "*p
"nnoremap <SPACE>P "*P

if has("autocmd")  " go back to where you exited
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

" Compile function
nmap \r :call ComplieRunGcc()<CR>
func! ComplieRunGcc()
  exec "w"
  if &filetype == 'vim'
    ":so %
  elseif &filetype == 'markdown'
    "exec "MarkdownPreview"
  elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
  elseif &filetype == 'go'
		set splitbelow
		:sp
    :term go run %
  elseif &filetype == 'java'
    set splitbelow
    :sp
    :term time java %
  endif
endfunc


source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/defx.vim
source ~/.config/nvim/config/coc.vim
"source ~/.config/nvim/config/ultisnips.vim
"source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/go.vim
source ~/.config/nvim/config/translator.vim
