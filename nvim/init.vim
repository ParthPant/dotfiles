lua require("init")

nmap <c-c> "+y
vmap <c-c> "+y
nmap <leader>v "+p
inoremap <leader>v <c-r>+
cnoremap <leader>v <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <leader>v
