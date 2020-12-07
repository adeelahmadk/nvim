let g:startify_session_dir = '~/.config/nvim/session'

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
          \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 't': '~/.config/alacritty/alacritty.yml' },
            \ { 'b': '~/.bashrc.env.sh' },
            \ '~/docker',
            \ '~/workspace',
            \ '~/workspace/snippets',
            \ ]

" start Vim in a directory that contains a `Session.vim`,
" that session will be loaded automatically.
let g:startify_session_autoload = 1
" Delete all buffers when loading or closing a session.
" unsaved buffers are silently ignored.
let g:startify_session_delete_buffers = 1
" seek and change to the root directory of the VCS (if there is one).
let g:startify_change_to_vcs_root = 1
" Unicode box-drawing characters will be used in fortune header.
let g:startify_fortune_use_unicode = 1
" Automatically update sessions before leaving vim or loading
" new session.
let g:startify_session_persistence = 1
" Don't show <empty buffer> and <quit>.
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \'                   _                             __   ',
        \'       ____ _   __(_)___ ___     _________  ____/ /__ ',
        \'      / __ \ | / / / __ `__ \   / ___/ __ \/ __  / _ \',
        \'     / / / / |/ / / / / / / /  / /__/ /_/ / /_/ /  __/',
        \'    /_/ /_/|___/_/_/ /_/ /_/   \___/\____/\__,_/\___/ ',
        \]
