# Neovim IDE configuration

A configuration for `neovim` editor including plug-ins to enable IDE features like intellisense, bracket pairing, status lines, etc.

## Pre-requisites & Dependencies

First you need to install neovim, using your package manager preferablly:

```sh
sudo apt install neovim
```

Install vim plug in the directory you cloned the repo:

```sh
<Down>curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Utils & Package managers

For dependencies, you'll need:

- xsel
- Python package pynvim
- npm package neovim

To install these deps:

```sh
sudo apt install xsel
```

`pynvim` can be installed with `pip`:

```sh
pip install pynvim
```

Node package neovim can be installed using `npm`:

```sh
npm install -g neovim
```



### Workflow tools

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



## Plug-ins & Extensions

Plug-ins that are pre-configured in this repo are:

- sheerun/vim-polyglot: Syntax Highlighting
- jiangmiao/auto-pairs: Bracket pairing
- neoclide/coc.nvim: Conquerer of Completion prediction & intellisense
- joshdick/onedark.vim: Theme
- vim-airline/vim-airline: Status/Tabline
- vim-airline/vim-airline-themes: Airline theme

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

You can install coc extensions of your choice by running command `:CocInstall coc-extension`. For example:

```
:CocInstall coc-html coc-css coc-json coc-tsserver coc-explorer
```

Don't forget to add language servers, along with other config, in `coc-settings.json` file. Default config includes following servers:

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

| Mapping    | Mode | Supported by      | Description                                 |
| ---------- | ---- | ----------------- | ------------------------------------------- |
| M-j        | n    | nvim              | resize h-split windows                      |
| M-k        | n    | nvim              | resize h-split windows                      |
| M-h        | n    | nvim              | resize v-split windows                      |
| M-l        | n    | nvim              | resize v-split windows                      |
| C-u        | n,i  | nvim              | easy caps current word                      |
| <tab>      | n    | nvim              | move to next buffer                         |
| <S-tab>    | n    | nvim              | move to previous buffer                     |
| C-s        | n    | nvim              | save                                        |
| C-q        | n    | nvim              | quit nvim                                   |
| <          | n    | nvim              | insert tab (indent)                         |
| >          | n    | nvim              | remove tab                                  |
| C-h        | n    | nvim              | navigate to the window on left              |
| C-j        | n    | nvim              | navigate to the window below                |
| C-k        | n    | nvim              | navigate to the window above                |
| C-l        | n    | nvim              | navigate to the window on right             |
| <leader>o  | n    | nvim              | insert empty line below current line        |
| <leader>O  | n    | nvim              | insert empty line above current line        |
| [g         | n    | coc               | navigate previous diagnostic                |
| ]g         | n    | coc               | navigate next diagnostic                    |
| gd         | n    | coc               | goto definition (of a ref.)                 |
| gy         | n    | coc               | goto type definition                        |
| gi         | n    | coc               | goto implementation                         |
| gr         | n    | coc               | goto references (of a def.)                 |
| K          | n    | coc               | show doc.                                   |
| <leader>rn | n    | coc               | rename a symbol (all instances)             |
| <spc>a     | n    | coc > CocList     | show all diagnostics                        |
| <spc>c     | n    | coc > CocList     | show coc commands                           |
| <spc>ou    | n    | coc > CocList     | outline symbols of current doc.             |
| <spc>s     | n    | coc > CocList     | search workspace symbols                    |
| <spc>ex    | n    | coc > CocList     | manage extensions                           |
| <spc>e     | n    | coc > Explorer    | open coc file explorer                      |
| <spc>f     | n    | coc > Explorer    | open floating coc file explorer             |
| <spc>r     | n    | ranger            | toggle ranger file explorer                 |
| :FZF       | n    | fzf > FZF         | fuzzy file search                           |
| C-f        | n    | fzf > Files       | file search with preview                    |
| :BLines    | n    | fzf > BLines      | search within a large file open in a buffer |
| :Lines     | n    | fzf > Lines       | search in all the open buffers              |
| <spc>b     | n    | fzf > Buffers     | buffer preview & switching                  |
| <spc>g     | n    | ripgrep > Rg      | ripgrep: regex search within file contents  |
| <spc>t     | n    | ctags > Tags      | Ctags:                                      |
| <spc>m     | n    | :Marks            |                                             |
| :History   | n    |                   | browse history of commands                  |
| :Ag        | n    | silversurfer > Ag | content search within project directory     |

Completion and key binding files for `fzf` are located in `autoload/plugged/fzf/shell/`:

```
completion.bash
completion.zsh
key-bindings.bash
key-bindings.fish
key-bindings.zsh
```

In order to use  fzf commands and features in terminal, you need to source the relevant files as:

```sh
source $HOME/.config/nvim/autoload/plugged/fzf/shell/completion.zsh
source $HOME/.config/nvim/autoload/plugged/fzf/shell/key-bindings.zsh

source $HOME/.config/nvim/autoload/plugged/fzf/shell/completion.bash
source $HOME/.config/nvim/autoload/plugged/fzf/shell/key-bindings.bash
```



## Refereces

1. For further details check [ChrisAtMachine](https://www.chrisatmachine.com/neovim/) blog.
2. Check this [youtube playlist](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg) by ChrisAtMachine.
