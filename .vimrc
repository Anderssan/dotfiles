call plug#begin()

	Plug 'altercation/vim-colors-solarized'
	Plug 'scrooloose/nerdtree'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'itchyny/lightline.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'numirias/semshi'
	Plug 'w0rp/ale'
	Plug 'tpope/vim-commentary'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'terryma/vim-multiple-cursors'
	Plug 'rhysd/accelerated-jk'
	Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-fugitive'

call plug#end()

syntax on
set shiftwidth=4
set tabstop=4
set number relativenumber
colorscheme afterglow
" let g:semshi#excluded_hl_groups = ['global', 'local']
let g:semshi#mark_selected_nodes = 0
let g:semshi#error_sign = 0
let g:semshi#update_delay_factor = 0.01
let g:semshi#excluded_hl_groups = ['local', 'attribute', 'imported']

"cursor"

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)


"air-line"
"colorscheme"
"shows the current branch"
let g:airlin#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#ale#enabled = 1
"Font for symbols"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = 'ÓÇ†'
let g:airline_symbols.notexists = '…Ü'
let g:airline_symbols.linenr = '‚ò∞'
let g:airline_left_sep = '¬ª'
let g:airline_symbols.dirty='!'
let g:airline_symbols.maxlinenr = ' „èë'
let g:airline_symbols.paste = 'œÅ'
"lightline colorscheme"
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

"Ale"
"always have a column"
let g:ale_sign_column_always = 1
let g:deoplete#enable_at_startup = 1
"Nerdtree"
let g:NERDTreeChDirMode = 2
packloadall
silent! helptags ALL

"alt+l to the right-window"
nnoremap <A-l> <C-w>l
"alt+h arrown to move to the left-window"
nnoremap <A-h> <C-W>h
"Alt + j = move line down
nnoremap <A-j> :m.+1<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
inoremap <A-j> <Esc>:m .+1<CR>==gi

"Alt + k = move line up
nnoremap <A-k> :m.-2<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap <A-k> <Esc>:m .-2<CR>==gi

"nt to go to nt"
nnoremap nt 1<C-w>w
"tnt to toggle nerdtree"
nnoremap tnt :NERDTreeToggle<CR>
"rnt to refresh nerdtree root"
nnoremap rnt :NERDTreeRefreshRoot<CR>

"shift + j = jump 10 lines down
nnoremap <S-J> :+10<CR>

"shift + k = jump 10 lines up
nnoremap <S-K> :-10<CR>

nnoremap <C-t> :tabedit<CR>

"tab = go to next tab
nnoremap <tab> :tabn<CR>
"shift + tab = go to previous tab
nnoremap <S-tab> :tabp<CR>

"ctr + l = unhighlight words
nnoremap <silent> <C-l> :nohl<CR><C-l>

function MyCustomHighlights()
    hi semshiSelf      ctermfg=75
endfunction
autocmd FileType python call MyCustomHighlights()

