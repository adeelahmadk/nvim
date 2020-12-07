# Neovim IDE configuration

[TOC]

A configuration for `neovim` editor including plug-ins to enable IDE features like intellisense, bracket pairing, status lines, etc.

## Pre-requisites & Dependencies

First you need to install neovim, using your package manager preferably:

```sh
sudo apt install neovim
```

Install vim plug in the directory you cloned the repo:

```sh
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Utilities & Package managers

For dependencies, you'll need:

- `xsel`
- Python package `pynvim`
- `npm` package `neovim`

To install these dependencies:

```sh
sudo apt install xsel
```

`pynvim` can be installed with `pip`:

```sh
pip install pynvim
```

Node package `neovim` can be installed using `npm`:

```sh
npm install -g neovim
```



### Work-flow tools

- **ranger**: file search
- **fzf**: general-purpose command-line fuzzy finder
- **ripgrep**: recursively searches directories for a regex pattern
- **universal-ctags**: build tag file indexes of source code definitions (Exuberant Ctags)
- **silver-searcher**: very fast grep-like searching program
- **fd**: fast and user-friendly alternative to find

Install ranger file search to use the key mapping:

```sh
sudo apt install ranger

# clone ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# install extension to enable image preview.
pip install ueberzug
```

add this config to `~/.config/ranger/rc.conf`:

```
set preview_images_method ueberzug

default_linemode devicons

set show_hidden true
```

you may need to run this in nvim:

```
:RnvimrSync
```

For searchers & tagging install:

```sh
sudo apt install fzf ripgrep universal-ctags
sudo apt install silversearcher-ag fd-find
```

Plug FZF &vim-rooter into nvim (`init.vim`):

```
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
```



### Color-aid

- **Vim Colorizer**: color highlighter for Neovim written in `luajit`. It sets color code's background to help understand visually. You can increment and decrement numbers in vim with `c-a` and `c-x`.
- **Rainbow parentheses**: different colored parentheses for different nested scopes.

#### Note

Install `luarocks` if you want to use with `coc-lua` extension.

```sh
sudo apt install luarocks
```



## Plug-ins & Extensions

Plug-ins that are pre-configured in this repo are:

- sheerun/vim-polyglot: Syntax Highlighting
- jiangmiao/auto-pairs: Bracket pairing
- neoclide/coc.nvim: Conquerer of Completion prediction & intellisense
- joshdick/onedark.vim: Theme
- vim-airline/vim-airline: Status/Tabline
- vim-airline/vim-airline-themes: Airline theme
- kevinhwang91/rnvimr: `ranger` file explorer integration
- junegunn/fzf.vim: `fzf` fuzzy search
- airblade/vim-rooter: Adjust file explorer path to VCS project root
- tpope/vim-commentary: Toggle comments
- norcalli/nvim-colorizer.lua: Shows color codes in same colored background
- junegunn/rainbow_parentheses.vim: Different color brackets in each nested scope.
- mhinz/vim-startify: Better project management with a fancy start screen
- mhinz/vim-signify: Show git hunks in vim gutter
- tpope/vim-fugitive: Git command wrapper for vim
- tpope/vim-rhubarb: Browse repo, insert issue # & urls
- junegunn/gv.vim: Git commit browser

In addition to these, there are `coc` extensions for intellisense:

- vimlsp
- sh
- markdown
- json
- html
- css
- tsserver
- eslint
- python
- yaml
- explorer

## Theme

There are multiple light & dark themes, with respective config under `themes/`, included in this setup. You can switch to the theme of your choice from `init.vim`. Default theme is set to `onedark` with config in `themes/onedark.vim` sourced from `init.vim`. To add more themes, add github path (`dev/repo`) in `vim-plug/plugins.vim` file like:

```
Plug 'lifepillar/vim-solarized8'
```

restart nvim and run `:PlugInstall`. To activate an installed theme, create a config file in `themes` directory 

```sh
touch ~/.config/nvim/themes/vim-solarize8.vim
```

and source this file in `init.vim`.

```sh
source $HOME/.config/nvim/themes/vim-solarize8.vim
```

Visit this [theme collection repo](https://github.com/rafi/awesome-vim-colorschemes) to select different theme, if you want.

## CoC Extensions

You can install `coc` extensions of your choice by running command `:CocInstall coc-extension` [[ref#3](#References)]. For example:

```
:CocInstall coc-html coc-css coc-json coc-tsserver coc-explorer
```

Don't forget to add language servers, along with other configurations, in `coc-settings.json` file [[ref#4,5](#References)]. Default configuration includes following servers:

```
{
	"coc.preferences.formatOnSaveFiletypes": ["css", "markdown", "javascript", "graphql", "html", "yaml",  "json", "python"],
	// python config
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,

    "snippets.ultisnips.directories":
    [
        "UltiSnips",
        "~/.config/nvim/utils/snips"
    ]	
}
```




## Custom key mappings & Commands

The leader key is set to `space`. Frequently used key bindings are listed in the table below:

| Mapping                 | Mode | Supported by      | Description                                 |
| ----------------------- | ---- | ----------------- | ------------------------------------------- |
| M-j                     | n    | nvim              | resize h-split windows                      |
| M-k                     | n    | nvim              | resize h-split windows                      |
| M-h                     | n    | nvim              | resize v-split windows                      |
| M-l                     | n    | nvim              | resize v-split windows                      |
| C-u                     | n,i  | nvim              | easy caps current word                      |
| <tab>                   | n    | nvim              | move to next buffer                         |
| <S-tab>                 | n    | nvim              | move to previous buffer                     |
| C-s                     | n    | nvim              | save                                        |
| C-q                     | n    | nvim              | quit neovim (after saving open buffers)     |
| <                       | n    | nvim              | insert tab (indent)                         |
| >                       | n    | nvim              | remove tab                                  |
| C-h                     | n    | nvim              | navigate to the window on left              |
| C-j                     | n    | nvim              | navigate to the window below                |
| C-k                     | n    | nvim              | navigate to the window above                |
| C-l                     | n    | nvim              | navigate to the window on right             |
| <leader>o               | n    | nvim              | insert empty line below current line        |
| <leader>O               | n    | nvim              | insert empty line above current line        |
| [g                      | n    | coc               | navigate previous diagnostic                |
| ]g                      | n    | coc               | navigate next diagnostic                    |
| gd                      | n    | coc               | goto definition (of a ref.)                 |
| gy                      | n    | coc               | goto type definition                        |
| gi                      | n    | coc               | goto implementation                         |
| gr                      | n    | coc               | goto references (of a def.)                 |
| K                       | n    | coc               | show doc.                                   |
| <leader>rn              | n    | coc               | rename a symbol (all instances)             |
| <leader>a               | n    | coc > CocList     | show all diagnostics                        |
| <leader>c               | n    | coc > CocList     | show coc commands                           |
| <leader>ou              | n    | coc > CocList     | outline symbols of current doc.             |
| <leader>s               | n    | coc > CocList     | search workspace symbols                    |
| <leader>ex              | n    | coc > CocList     | manage extensions                           |
| <leader>e               | n    | coc > Explorer    | open coc file explorer                      |
| <leader>f               | n    | coc > Explorer    | open floating coc file explorer             |
| <leader>r               | n    | ranger            | toggle ranger file explorer                 |
| :FZF                    | n    | fzf > FZF         | fuzzy file search                           |
| C-f                     | n    | fzf > Files       | file search with preview                    |
| :BLines                 | n    | fzf > BLines      | search within a large file open in a buffer |
| :Lines                  | n    | fzf > Lines       | search in all the open buffers              |
| <leader>b               | n    | fzf > Buffers     | buffer preview & switching                  |
| <leader>g               | n    | ripgrep > Rg      | ripgrep: regex search within file contents  |
| <leader>t               | n    | ctags > Tags      | Ctags:                                      |
| <leader>m               | n    | :Marks            |                                             |
| :History                | n    |                   | browse history of commands                  |
| :Ag                     | n    | silversurfer > Ag | content search within project directory     |
| <leader>/               | n,v  | vim-commentary    | toggle comment/uncomment a line or a block  |
| :SLoad                  | n    | vim-startify      | load a session [[ref#6,7](#References)]     |
| :SSave[!]               | n    | vim-startify      | save a session of open buffers              |
| :SDelete[!]             | n    | vim-startify      | delete a session                            |
| :SClose                 | n    | vim-startify      | close an open session                       |
| :SignifyToggle          | n    | vim-signify       | toggle git hunks in the gutter              |
| :SignifyToggleHighlight | n    | vim-signify       | toggle git status color highlites           |
| <leader>gj              | n    | vim-signify       | jump to next hunk                           |
| <leader>gk              | n    | vim-signify       | jump to previous hunk                       |
| :Git add                | n    | vim-fugitive      | git add ([ref#8](#References) for detail)   |
| :Git commit             | n    | vim-fugitive      | git commit                                  |
| :Git push               | n    | vim-fugitive      | git push                                    |
| :Git pull               | n    | vim-fugitive      | git pull                                    |
| :Git diff               | n    | vim-fugitive      | git diff                                    |
| :Git log                | n    | vim-fugitive      | git log                                     |
| :Git blame              | n    | vim-fugitive      | git blame                                   |
| :Gdiffsplit             | n    | vim-fugitive      | git diff in vsplit                          |
| :GRemove                | n    | vim-fugitive      | git rm                                      |
| :GBrowse                | n    | vim-fugitive      | open the current file on the web front-end  |

Completion and key binding files for `fzf` are located in `autoload/plugged/fzf/shell/`:

```
completion.bash
completion.zsh
key-bindings.bash
key-bindings.fish
key-bindings.zsh
```

In order to use  `fzf` commands and features in terminal, you need to source the relevant files as:

```sh
source $HOME/.config/nvim/autoload/plugged/fzf/shell/completion.zsh
source $HOME/.config/nvim/autoload/plugged/fzf/shell/key-bindings.zsh

source $HOME/.config/nvim/autoload/plugged/fzf/shell/completion.bash
source $HOME/.config/nvim/autoload/plugged/fzf/shell/key-bindings.bash
```



## References

1. For further details check [ChrisAtMachine](https://www.chrisatmachine.com/neovim/) blog.
2. [YouTube playlist](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg) by ChrisAtMachine.
3. Conquer of Completion (CoC) [GitHub](https://github.com/neoclide/coc.nvim) page.
4. CoC GitHub wiki: [Using the configuration file](https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file)
5. CoC GitHub wiki: [Using coc extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)
6. Better project management with a fancy start screen: [startify](https://github.com/mhinz/vim-startify/wiki/Example-configurations)
7. [Sane-defaults](https://www.chrisatmachine.com/Neovim/11-startify/) for `startify`
8. vim-fugitive [GitHub](https://github.com/tpope/vim-fugitive) page.
