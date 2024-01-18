" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" vnoremap <C-s> :w<CR>
" inoremap <C-s> :w<CR>

" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" alt + ;/. to move line(s) up/down
nnoremap <M-.> :m .+1<CR>==
nnoremap <M-;> :m .-2<CR>==
inoremap <M-.> <Esc>:m .+1<CR>==gi
inoremap <M-;> <Esc>:m .-2<CR>==gi
vnoremap <M-.> :m '>+1<CR>gv=gv
vnoremap <M-;> :m '<-2<CR>gv=gv

" Cycle through line numbers & relative line numbers
" nnoremap <silent> <F6> :exec &nu==&rnu? "set nu!" : "set rnu!"<CR>
" Toggle between absolute line numbers & relative line numbers(set number relativenumber)
nnoremap <silent> <F5> :exec &nu==&rnu? "set rnu!" : "set rnu"<CR>

" (o/O) insert balnk line below/above,
" (^D) del all in new line, (a) goto insert mode
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" toggle comments
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>
