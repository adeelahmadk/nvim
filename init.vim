"     _       _ __        _
"    (_)___  (_) /__   __(_)___ ___
"   / / __ \/ / __/ | / / / __ `__ \
"  / / / / / / /__| |/ / / / / / / /
" /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" File: init.vim
" Author: codegenki
" Description: main neovim configuration file
" Last Modified: November 10, 2020

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
" plug-in airline config
source $HOME/.config/nvim/themes/airline.vim
" barbar tabline config
" source $HOME/.config/nvim/plug-config/barbar.vim
" luafile $HOME/.config/nvim/lua/nvcodeline.lua
" Path to bin utils required by the config

" colorize color codes
"lua require'plug-colorizer'
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/rainbow.vim

source $HOME/.config/nvim/general/paths.vim
" plug-in coc (Conquerer of Completion) config
source $HOME/.config/nvim/plug-config/coc.vim
" expand html/css abbreviations
source $HOME/.config/nvim/plug-config/emmet.vim
" Auto change html tags
source $HOME/.config/nvim/plug-config/tagalong.vim

" Ranger file search
source $HOME/.config/nvim/plug-config/rnvimr.vim
" FZF fuzzy search
source $HOME/.config/nvim/plug-config/fzf.vim

" Fancy startup screen for project management
source $HOME/.config/nvim/plug-config/start-screen.vim
" git integration
source $HOME/.config/nvim/plug-config/signify.vim

" keybindings popup
source $HOME/.config/nvim/keys/which-key.vim
" floating terminal for Neovim
source $HOME/.config/nvim/plug-config/floaterm.vim
" distraction free mode
source $HOME/.config/nvim/plug-config/goyo.vim
