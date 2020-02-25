let g:translator_target_lang = "zh"
let g:translator_source_lang = "auto"
let g:translator_default_engines = ["ciba","youdao"]
let g:translator_history_enable = v:true
let g:translator_window_borderchars = v:null

""" Configuration example
" Echo translation in the cmdline
nmap <silent> <space>t <Plug>Translate
vmap <silent> <space>t <Plug>TranslateV
" Display translation in a window
nmap <silent> <space>w <Plug>TranslateW
vmap <silent> <space>w <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <space>r <Plug>TranslateR
vmap <silent> <space>r <Plug>TranslateRV

""" Highlight
" Text highlight of translator window
hi def link TranslatorQuery             Identifier
hi def link TranslatorPhonetic          Type
hi def link TranslatorExplain           Statement
hi def link TranslatorDelimiter         Special
" Background of translator window border
hi def link TranslatorNF                NormalFloat
hi def link TranslatorBorderNF          NormalFloat
