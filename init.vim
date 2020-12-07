" Vim-Plug plug-in manager config
source $HOME/.config/nvim/vim-plug/plugins.vim
" General vim/nvim settings
source $HOME/.config/nvim/general/settings.vim
" vim/nvim key mappings
source $HOME/.config/nvim/keys/mappings.vim

" onedark theme config
source $HOME/.config/nvim/themes/onedark.vim
" Theme - papercolor light/dark theme
" source $HOME/.config/nvim/themes/papercolor.vim
" Theme - github light theme
" source $HOME/.config/nvim/themes/github.vim

" colorize color codes
"lua require'plug-colorizer'
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/rainbow.vim

" plug-in airline config
source $HOME/.config/nvim/themes/airline.vim
" Path to bin utils required by the config
source $HOME/.config/nvim/general/paths.vim
" plug-in coc (Conquerer of Completion) config
source $HOME/.config/nvim/plug-config/coc.vim
" Ranger file search
source $HOME/.config/nvim/plug-config/rnvimr.vim
" FZF fuzzy search
source $HOME/.config/nvim/plug-config/fzf.vim
" Fancy startup screen for project management
source $HOME/.config/nvim/plug-config/start-screen.vim
" git integration
source $HOME/.config/nvim/plug-config/signify.vim
