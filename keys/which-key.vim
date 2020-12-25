let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Timeout
" let g:which_key_timeout = 100

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=500


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
" let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'                , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                            , 'open init' ]
let g:which_key_map['='] = [ '<C-W>='                                 , 'balance windows' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'                   , 'toggle coc-explorer']
let g:which_key_map['f'] = [ ':CocCommand explorer --preset floating' , 'open floating coc-explorer']
let g:which_key_map['h'] = [ '<C-W>s'                                 , 'split below']
let g:which_key_map['n'] = [ ':let @/ = ""'                           , 'no highlight' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'                          , 'open' ]
let g:which_key_map['q'] = [ '<Plug>(coc-fix-current)'                , 'quick fix' ]
let g:which_key_map['T'] = [ ':Rg'                                    , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                                 , 'split right']
let g:which_key_map['x'] = [ ':bd'                                    , 'del buffer' ]
let g:which_key_map['z'] = [ 'Goyo'                                   , 'zen' ]

" g for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':SignifyToggleHighlight'           , 'highlight hunks'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(signify-next-hunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(signify-prev-hunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ 't' : [':SignifyToggle'                    , 'toggle signs'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }
      " \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      " \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      " \ 'S' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      " \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],

" l for lsp: language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList Commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'o' : [':CocList outline'                    , 'outline'],
      \ 's' : [':CocList -I symbols'                 , 'list int. symbols'],
      \ 'S' : [':CocList snippets'                   , 'list snippets'],
      \ 'u' : [':CocListResume'                      , 'resume'],
      \ }

" s for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'preview buffers'],
      \ 'c' : [':Commits'      , 'view commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'search lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'c' : [':SClose'          , 'Close Session']  ,
      \ 'd' : [':SDelete'         , 'Delete Session'] ,
      \ 'l' : [':SLoad'           , 'Load Session']     ,
      \ 's' : [':Startify'        , 'Start Page']     ,
      \ 'S' : [':SSave'           , 'Save Session']   ,
      \ }

let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 'b' : [':FloatermNew bpytop'                            , 'bpytop'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }
" \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
