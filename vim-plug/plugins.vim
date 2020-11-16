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

    " Theme - Onedark theme for nvim
    Plug 'joshdick/onedark.vim'
    " Theme - papercolor light/dark theme
    Plug 'NLKNguyen/papercolor-theme'
    " Theme - GitHub inspired light theme
    Plug 'endel/vim-github-colorscheme'

    " Intellisense - Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Keeping up to date with master
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " File explorer & search
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

    " FZF fuzzy search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " vim-rooter 
    Plug 'airblade/vim-rooter'

    " Status / tabline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()
