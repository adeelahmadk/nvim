" File: gruvbox.vim theme configuration

" ***Restart required after switching mode***
" set background=dark    " Setting dark mode
set background=light   " Setting light mode

" Since gruvbox inverts cursor color, it could be awkward
" to determine current position, when the search is highlighted.
" To get single cursor color while searching, enable these mappings:
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

autocmd vimenter * ++nested colorscheme gruvbox
