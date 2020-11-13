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

