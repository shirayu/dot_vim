# .vimrc

## Vim

```sh
pip3 install neovim
```

## NeoVim

```sh
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

## Install

```sh
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
vi +':call dein#install()' +q

# Setup plugins
./setup.sh load

# Update plugins
./setup.sh update
```

[You may need](https://stackoverflow.com/questions/66653234/vim-eslint-not-approved-or-denied-yet) the following command in vim.

```txt
:CocCommand eslint.showOutputChannel
```

## Change default editor

```bash
sudo update-alternatives --config editor
```
