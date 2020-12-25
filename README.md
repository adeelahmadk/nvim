# Neovim IDE configuration



A configuration for `neovim` editor including plug-ins to enable IDE-like features like intellisense, bracket pairing, status lines, etc.

## Pre-requisites & Dependencies

First you need to install neovim, using your package manager preferably:

```sh
sudo apt install neovim
```

Clone this configuration in `~/.config`:

```sh
cd ~/.config
git clone https://github.com/cod3g3nki/nvim.git
# or clone a specific tag (vx.x.x), e.g.
git clone -b v0.2.0 --depth 1 https://github.com/cod3g3nki/nvim.git
```

Install `vim-plug` in the directory you cloned the repo:

```sh
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Start nvim and run command `:PlugInstall`, restart nvim for configuration and plug-ins to take effect or run `:source $MYVIMRC`. You may also skip installing `vim-plug` and run `:PlugInstall` command on the first run.

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

### Terminal utilities & Work-flow tools

This configuration uses some terminal utilities for file management, searching, resource monitoring, etc. You must install these or disable/delete respective configuration.

- **ranger**: file search & management.
- **fzf**: general-purpose command-line fuzzy finder.
- **ripgrep**: recursively searches directories for a regex pattern.
- **universal-ctags**: build tag file indexes of source code definitions (Exuberant Ctags).
- **silver-searcher**: very fast grep-like searching program.
- **fd**: fast and user-friendly alternative to find.
- **ncdu:** `NCurses` based `du`, a directory size utility.
- **nnn:** A terminal based file explorer.

Install ranger file search to use the key mapping:

```sh
sudo apt install ranger

# clone ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# install extension to enable image preview.
pip install ueberzug
```

add following configuration to `~/.config/ranger/rc.conf`:

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

- mattn/vim-gist: Easily create gists

- liuchengxu/vim-which-key: Displays available keybindings in popup (`leader` key)

- voldikss/vim-floaterm: A floating terminal for Neovim

- honza/vim-snippets: A repo of snipMate & UltiSnip snippets used with coc-snippets

- mattn/emmet-vim: Expand abbreviations for (x)HTML/CSS

- AndrewRadev/tagalong.vim: Rename closing HTML/XML tags when editing opening ones (vice versa)

- junegunn/goyo.vim: Distraction-free writing, zend mode

    

In addition to these, following `coc` extensions can be installed for intellisense:

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
- snippets
- fzf-preview

For detail check [coc GitHub wiki](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions).

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

You can install `coc` extensions of your choice by running command `:CocInstall coc-extension` [[ref#4](#References)]. For example:

```
:CocInstall coc-html coc-css coc-json coc-tsserver coc-explorer
```

Don't forget to add language servers, along with other configurations, in `coc-settings.json` file [[ref#5,6](#References)]. Default configuration includes following servers:

```
{
	"coc.preferences.formatOnSaveFiletypes":
	[
		"css",
		"markdown",
		"javascript",
		"graphql",
		"html",
		"yaml",
		"json",
		"python"
	],
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

**key mappings for > v 0.2.0:** configuration has some major changes in key mappings after introduction of *which-key* plug-in.

The leader key is set to `space`. Frequently used key bindings are listed in the table below:

| Mapping       | Cmd                               | Mode  | Supported by             | Description                                                  |
| ------------- | --------------------------------- | ----- | ------------------------ | ------------------------------------------------------------ |
| M-j           |                                   | n     | nvim                     | resize h-split windows                                       |
| M-k           |                                   | n     | nvim                     | resize h-split windows                                       |
| M-h           |                                   | n     | nvim                     | resize v-split windows                                       |
| M-l           |                                   | n     | nvim                     | resize v-split windows                                       |
| C-u           |                                   | n,i   | nvim                     | easy caps current word                                       |
| <`tab`>       |                                   | n     | nvim                     | move to next buffer                                          |
| <S-`tab`>     |                                   | n     | nvim                     | move to previous buffer                                      |
| C-s           |                                   | n     | nvim                     | save                                                         |
| C-q           |                                   | n     | nvim                     | quit neovim (after saving open buffers)                      |
| <             |                                   | n     | nvim                     | insert tab (indent)                                          |
| >             |                                   | n     | nvim                     | remove tab                                                   |
| C-h           |                                   | n     | nvim                     | navigate to the window on left                               |
| C-j           |                                   | n     | nvim                     | navigate to the window below                                 |
| C-k           |                                   | n     | nvim                     | navigate to the window above                                 |
| C-l           |                                   | n     | nvim                     | navigate to the window on right                              |
| <M-;>         |                                   | n,i,v | nvim                     | move line(s) of code up                                      |
| <M-.>         |                                   | n,i,v | nvim                     | move line(s) of code down                                    |
| o             |                                   | n     | nvim                     | insert empty line below current line                         |
| O             |                                   | n     | nvim                     | insert empty line above current line                         |
| <`leader`>o   | `o<Esc>^Da`                       | n     | nvim                     | insert empty line below, delete line, insert mode            |
| <`leader`>O   | `O<Esc>^Da`                       | n     | nvim                     | insert empty line above, delete line, insert mode            |
| **CoC**       |                                   |       |                          |                                                              |
| [g            |                                   | n     | coc                      | navigate previous diagnostic                                 |
| ]g            |                                   | n     | coc                      | navigate next diagnostic                                     |
| gd            |                                   | n     | coc                      | goto definition (of a ref.)                                  |
| gy            |                                   | n     | coc                      | goto type definition                                         |
| gi            |                                   | n     | coc                      | goto implementation                                          |
| gr            |                                   | n     | coc                      | goto references (of a def.)                                  |
| K             |                                   | n     | coc                      | show doc.                                                    |
| **Which-Key** |                                   |       |                          | [[Ref#14](#References)]                                      |
| <`leader`>/   |                                   | n,v   | vim-commentary           | toggle comment(s): comment/uncomment a line or a block       |
| <`leader`>=   | <`C-w`>=                          | n,v   | nvim                     | balance windows                                              |
| <`leader`>e   |                                   | n     | coc > Explorer           | open coc file explorer                                       |
| <`leader`>f   |                                   | n     | coc > Explorer           | open floating coc file explorer                              |
| <`leader`>h   | <`C-w`>s                          | n     | nvim                     | split below (horizontal)                                     |
| <`leader`>n   |                                   | n,v   | nvim                     | no highlight                                                 |
| <`leader`>r   | :RnvimrToggle                     | n     | vim-rnvimr               | open file (ranger)                                           |
| <`leader`>q   |                                   | n     | coc                      | quick fix                                                    |
| <`leader`>rn  |                                   | n     | coc                      | rename a symbol (all instances)                              |
| <`leader`>r   |                                   | n     | ranger                   | toggle ranger file explorer                                  |
| <`leader`>T   | :Rg                               | n     | fzf                      | ripgrep text                                                 |
| <`leader`>v   | <`C-w`>v                          | n     | nvim                     | split right (vertical)                                       |
| <`leader`>x   | :bd                               | n     | nvim                     | delete/unload current buffer                                 |
| <`leader`>z   | :Goyo                             | n     | goyo.vim                 | distraction-free writing (zen)                               |
| <`leader`>g   |                                   | n     | vim-which-key            | Git sub-menu                                                 |
| a             | :Git add                          | n     | which-key > vim-fugitive | add all ([[ref#9](#References)] for detail)                  |
| b             | :Git blame                        | n     | which-key > vim-fugitive | git blame                                                    |
| B             | :GBrowse                          | n     | which-key > vim-fugitive | open the current file on the web front-end                   |
| c             | :Git commit                       | n     | which-key > vim-fugitive | git commit                                                   |
| d             | :Git diff                         | n     | which-key > vim-fugitive | git diff                                                     |
| D             | :Gdiffsplit                       | n     | which-key > vim-fugitive | git diff in vsplit                                           |
| g             | :GGrep                            | n     | which-key > vim-fugitive | git grep unstaged                                            |
| G             | :Gstatus                          | n     | which-key > vim-fugitive | git status                                                   |
| h             |                                   | n     | which-key > vim-signify  | toggle git hunk highlights                                   |
| i             | :Gist -b                          | n     | vim-gist                 | post gist [[ref#11](#References)]                            |
| j             | <`Plug`>(signify-next-hunk)       | n     | which-key > vim-signify  | jump to next hunk (<`leader`>gj)                             |
| k             | <`Plug`>(signify-prev-hunk)       | n     | which-key > vim-signify  | jump to previous hunk (<`leader`>gk)                         |
| l             | :Git log                          | n     | which-key > vim-fugitive | git log                                                      |
| p             | :Git push                         | n     | which-key > vim-fugitive | git push                                                     |
| P             | :Git pull                         | n     | which-key > vim-fugitive | git pull                                                     |
| r             | :Gremove                          | n     | which-key > vim-fugitive | git rm                                                       |
| s             | :CocCommand fzf-preview.GitStatus | n     | coc > fzf-preview        | git status file actions preview                              |
| t             | :SignifyToggle                    | n     | which-key > vim-signify  | toggle hunk signs                                            |
| v             | :GV                               | n     | which-key > gv           | open commit browser                                          |
| V             | :GV!                              | n     | which-key > gv           | only list commits that affected the current file             |
| <`leader`>l   |                                   |       | vim-which-key            | Language Server Protocol (lsp)                               |
| a             |                                   | n     | coc                      | code action                                                  |
| A             |                                   | n     | coc                      | selected action                                              |
| b             | :CocNext                          | n     | coc                      | next action                                                  |
| B             | :CocPrev                          | n     | coc                      | previous action                                              |
| c             | :CocList Commands                 | n     | CocList                  | show coc commands                                            |
| d             |                                   | n     | coc                      | go to definition                                             |
| D             |                                   | n     | coc                      | go to declaration                                            |
| e             | :CocList extensions               | n     | CocList                  | manage extensions                                            |
| I             | :CocList diagnostics              | n     | CocList                  | show all diagnostics                                         |
| o             | :CocList outline                  | n     | CocList                  | outline symbols of current doc.                              |
| s             | :CocList -I symbols               | n     | CocList                  | search workspace symbols                                     |
| S             | :CocList snippets                 | n     | CocList                  | list snippets                                                |
| u             | :CocListResume                    | n     | CocList                  | resume                                                       |
| <`leader`>s   |                                   |       | vim-which-key            | Search [[ref#7](#References)]                                |
| /             | :History/                         | n     | fzf                      | search command history                                       |
| ;             | :Commands                         | n     | fzf                      | Commands browser                                             |
| a             | :Ag                               | n     | fzf                      | content search within project directory                      |
| b             | :BLines                           | n     | fzf                      | search within a large file open in a buffer                  |
| B             | :Buffers                          | n     | fzf                      | open buffers                                                 |
| c             | :Commits                          | n     | fzf                      | git commits                                                  |
| C             | :BCommits                         | n     | fzf                      | git commits for current buffer                               |
| f             | :Files                            | n     | fzf                      | fuzzy find files in project dir.                             |
| g             | :GFiles                           | n     | fzf                      | git ls-files                                                 |
| G             | :GFiles?                          | n     | fzf                      | git status                                                   |
| h             | :History                          | n     | fzf                      | view `v:oldfiles` and open buffers                           |
| H             | :History:                         | n     | fzf                      | command history                                              |
| l             | :Lines                            | n     | fzf                      | search lines in the loaded buffers                           |
| m             | :Marks                            | n     | fzf                      | list marked positions                                        |
| M             | :Maps                             | n     | fzf                      | normal mode mappings                                         |
| p             | :Helptags                         | n     | fzf                      | fuzzy search help tags                                       |
| P             | :Tags                             | n     | fzf                      | Tags in the project (C-tags)                                 |
| s             | :Snippets                         | n     | fzf                      | code snippets [[ref#12,13](#References)]                     |
| S             | :Colors                           | n     | fzf                      | color schemes                                                |
| t             | :Rg                               | n     | fzf                      | search in contents of the project files                      |
| T             | :BTags                            | n     | fzf                      | buffer tags                                                  |
| w             | :Windows                          | n     | fzf                      | open windows                                                 |
| y             | :Filetypes                        | n     | fzf                      | file types                                                   |
| z             | :FZF                              | n     | fzf                      | fuzzy file search                                            |
| <`leader`>S   |                                   |       | vim-which-key            | Project management [[ref#8,9](#References)]                  |
| c             | :SClose                           | n     | vim-startify             | close an open session                                        |
| d             | :SDelete                          | n     | vim-startify             | delete a session                                             |
| l             | :SLoad                            | n     | vim-startify             | load a session                                               |
| s             | :Startify                         | n     | vim-startify             | open start screen                                            |
| S             | :SSave                            | n     | vim-startify             | save a session of open buffers                               |
| <`leader`>t   |                                   | n     | vim-which-key            | `floaterm` commands                                          |
| b             | :FloatermNew bpytop               | n     | vim-floaterm             | resource monitor                                             |
| f             | :FloatermNew fzf                  | n     | vim-floaterm             | fuzzy search                                                 |
| d             | :FloatermNew lazydocker           | n     | vim-floaterm             | open lazydocker                                              |
| g             | :FloatermNew lazygit              | n     | vim-floaterm             | open lazygit in current project                              |
| n             | :FloatermNew node                 | n     | vim-floaterm             | node repl (shell)                                            |
| N             | :FloatermNew nnn                  | n     | vim-floaterm             | terminal file explorer                                       |
| p             | :FloatermNew python               | n     | vim-floaterm             | python repl (shell)                                          |
| r             | :FloatermNew ranger               | n     | vim-floaterm             | ranger file explorer                                         |
| s             | :FloatermNew ncdu                 | n     | vim-floaterm             | NCurses based `du`                                           |
| t             | :FloatermToggle                   | n     | vim-floaterm             | toggle floating terminal window                              |
| **GV**        |                                   |       |                          |                                                              |
| :GV?          |                                   | n     | gv                       | fills the location list with the revisions of the current file |
| :GV or :GV?   |                                   | v     | gv                       | track the changes in the selected lines.                     |
| gb            |                                   | n     | gv > Commit buffer       | :GBrowse commit under cursor                                 |
| o             |                                   | n     | gv > Commit buffer       | show contents of a commit                                    |
| o             |                                   | v     | gv > Commit buffer       | show diff of selected commits                                |
| O             |                                   | n,v   | gv > Commit buffer       | open in a new tab                                            |
| .             |                                   | n     | gv > Commit buffer       | open fugitive command `:Git [CURSOR] SHA`                    |
| q             |                                   | n     | gv > Commit buffer       | close                                                        |
| **Emmet**     |                                   |       |                          | [[Ref#15](#References)]                                      |
| <`C-Y`>,      |                                   | i     | emmet-vim                | expand abbreviation (e.g. html:5)                            |
| <`C-Y`>,      | Tag:                              | v     | emmet-vim                | write emmet abbr. for the selection                          |
| <`C-Y`>d      |                                   | i     | emmet-vim                | balance a tag Inward                                         |
| <`C-Y`>D      |                                   | i     | emmet-vim                | balance a tag Outward                                        |
| <`C-Y`>n      |                                   | n     | emmet-vim                | go to the next edit point                                    |
| <`C-Y`>N      |                                   | n     | emmet-vim                | go to the previous edit point                                |
| <`C-Y`>i      |                                   | i     | emmet-vim                | update an `<img>`’s Size                                     |
| <`C-Y`>m      |                                   | v     | emmet-vim                | merge lines                                                  |
| <`C-Y`>k      |                                   | n     | emmet-vim                | remove/del a tag                                             |
| <`C-Y`>j      |                                   | i     | emmet-vim                | split/join tags (between `<tag>` `</tag>` and `<tag/>`)      |
| <`C-Y`>/      |                                   | n     | emmet-vim                | toggle comments                                              |
| <`C-Y`>a      |                                   | n     | emmet-vim                | url to anchor tag (`<a>`)                                    |
| <`C-Y`>A      |                                   | n     | emmet-vim                | quoted text from url                                         |

Completion and key binding files for `fzf` are located in `autoload/plugged/fzf/shell/`:

```
completion.bash
completion.zsh
key-bindings.bash
key-bindings.fish
key-bindings.zsh
```

If you want to use  `fzf` commands and features in terminal, source the relevant files as:

```sh
source $HOME/.config/nvim/autoload/plugged/fzf/shell/completion.zsh
source $HOME/.config/nvim/autoload/plugged/fzf/shell/key-bindings.zsh

source $HOME/.config/nvim/autoload/plugged/fzf/shell/completion.bash
source $HOME/.config/nvim/autoload/plugged/fzf/shell/key-bindings.bash
```



## References

1. For further details check [ChrisAtMachine](https://www.chrisatmachine.com/neovim/) blog.
2. [YouTube playlist](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg) by ChrisAtMachine.
3. [Nerd Fonts](https://www.nerdfonts.com/) on [GitHub](https://github.com/ryanoasis/nerd-fonts).
4. Conquer of Completion (CoC) [GitHub](https://github.com/neoclide/coc.nvim) page.
5. CoC GitHub wiki: [Using the configuration file](https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file)
6. CoC GitHub wiki: [Using coc extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)
7. FZF [GitHub](https://github.com/junegunn/fzf) page.
8. Better project management with a fancy start screen: [startify](https://github.com/mhinz/vim-startify/wiki/Example-configurations)
9. [Sane-defaults](https://www.chrisatmachine.com/Neovim/11-startify/) for `startify`
10. vim-fugitive [GitHub](https://github.com/tpope/vim-fugitive) page.
11. vim-gist [GitHub](https://github.com/mattn/vim-gist) page.
12. vim-snippets: [GitHub](https://github.com/honza/vim-snippets) page.
13. coc-snippets [GitHub](https://github.com/neoclide/coc-snippets) page.
14. Which-Key [GitHub](https://github.com/liuchengxu/vim-which-key) page.
15. Emmet-vim [GitHub](https://github.com/mattn/emmet-vim) page.
