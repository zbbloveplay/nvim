" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

" ===
" === Other useful stuff
" ===
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

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'

call plug#end()

