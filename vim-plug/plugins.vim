" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Syntax Highlighting - Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " File Explorer - Browse & open files
    " Plug 'scrooloose/NERDTree'

    " Pair Brackets - Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Cool Icons
    " Plug 'kyazdani42/nvim-web-devicons'
    " Plug 'ryanoasis/vim-devicons'

    " Theme - Onedark theme for nvim
    Plug 'joshdick/onedark.vim'
    " Theme - Nord theme for nvim
    Plug 'arcticicestudio/nord-vim'
    " Theme - Gruvbox light theme
    " Plug 'morhetz/gruvbox'
    Plug 'morhetz/gruvbox'
    " Theme - papercolor light/dark theme
    Plug 'NLKNguyen/papercolor-theme'
    " Theme - GitHub inspired light theme
    Plug 'endel/vim-github-colorscheme'

    " Add Some Color
    Plug 'norcalli/nvim-colorizer.lua'
    " colorful bracket pairs
    Plug 'junegunn/rainbow_parentheses.vim'

    " Intellisense - Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Keeping up to date with master
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " File explorer & search
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " FZF fuzzy search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Have the file system follow you around
    Plug 'airblade/vim-rooter'

    " Status / tabline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Better tabline. Todo: wait for v0.5.0, config: barbar.vim
    " Plug 'romgrk/barbar.nvim'
    " New advanced status line. Todo: wait for v0.5.0, config: nvcodeline.lua, deps.: devicons
    " Plug 'glepnir/galaxyline.nvim'

    " comment out code
    Plug 'tpope/vim-commentary'

    " fancy startup page for project management
    Plug 'mhinz/vim-startify'

    " git integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " easily create gists
    Plug 'mattn/vim-gist'

    " keybindings popup
    Plug 'liuchengxu/vim-which-key'

    " floating terminal for neovim
    Plug 'voldikss/vim-floaterm'

    " code snippets for neovim
    Plug 'honza/vim-snippets'
    " Interactive code, Todo: write config
    " Plug 'metakirby5/codi.vim'
    " emmet for vim
    Plug 'mattn/emmet-vim'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'
    " async tasks, Todo: write config.
    " Plug 'skywind3000/asynctasks.vim'
    " Plug 'skywind3000/asyncrun.vim'

    " zen mode: distraction free writing, Todo hack config
    Plug 'junegunn/goyo.vim'
call plug#end()
