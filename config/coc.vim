" COC

set signcolumn=yes

" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
      \ 'coc-python',
      \ 'coc-vimlsp',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-tsserver',
      \ 'coc-yank',
      \ 'coc-lists',
      \ 'coc-gitignore',
      \ 'coc-vimlsp',
      \ 'coc-tailwindcss',
      \ 'coc-stylelint',
      \ 'coc-tslint',
      \ 'coc-lists',
      \ 'coc-git',
      \ 'coc-pyright',
      \ 'coc-sourcekit']
"      \ 'coc-explorer',
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"
"inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"<Paste>
" Use <cr> to confirm completion
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Useful commands
" show copy history
nnoremap <silent> gl :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
"nnoremap <leader>rn <Plug>(coc-rename)
"nmap tt :CocCommand explorer --toggle --sources=buffer+,file+ --file-columns=selection:clip:indent:icon:filename;fullpath;size;modified;readonly <CR><CR>
" coc-todolist
noremap da :CocCommand todolist.create<CR>
noremap td :CocCommand todolist.upload<CR>
noremap tD :CocCommand todolist.download<CR>
noremap tc :CocCommand todolist.clearNotice<CR>
noremap cl :CocList --normal todolist<CR>
" coc-translator
"nmap ts <Plug>(coc-translator-p)
"nmap tl :CocList translation<CR>
" coc-markmap
"command! Markmap CocCommand markmap.create
