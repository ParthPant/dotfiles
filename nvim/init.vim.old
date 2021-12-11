let mapleader="/"

"noremap ; l
"noremap l k
"noremap k j
"noremap j h

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'nvim-lua/popup.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Colorshemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim'

Plug 'preservim/nerdcommenter'

"C++ syntax highlighting
Plug 'bfrg/vim-cpp-modern'

"Specifically webdev related plugins
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'digitaltoad/vim-pug'
call plug#end()

colorscheme gruvbox 
"highlight Normal ctermbg=None
set number
set nowrap
set relativenumber
set cc=80
set nohlsearch

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt :CocCommand clangd.switchSourceHeader <CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"Open Startify ad then Nerdtree on startup
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            "\ |   NERDTree
            \ |   wincmd w
            \ | endif

inoremap jk <ESC>
"nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"FZF binding
nmap <C-p> :FZF<CR>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

syntax enable
"Tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set scrolloff=5

"Indentation
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
"let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_enabled=0
nmap <C-i> :IndentLinesToggle<CR>
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nmap <TAB> :Tagbar<CR>

"Icons
"set encoding=UTF-8
"let g:NERDTreeGitStatusIndicatorMapCustom = {
                "\ 'Modified'  :'✹',
                "\ 'Staged'    :'✚',
                "\ 'Untracked' :'✭',
                "\ 'Renamed'   :'➜',
                "\ 'Unmerged'  :'═',
                "\ 'Deleted'   :'✖',
                "\ 'Dirty'     :'✗',
                "\ 'Ignored'   :'☒',
                "\ 'Clean'     :'✔︎',
                "\ 'Unknown'   :'?',
                "\ }

"Git
nmap <C-g> :GitGutterBufferToggle<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"Lightline
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \}

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
augroup END

" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'pwd': {
\     'root-uri': getcwd(),
\   },
\ }

nmap <C-n> :CocCommand explorer<CR>
"nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

set exrc
set secure
