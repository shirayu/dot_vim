# .vimrc

```sh
# Update plugins
vi '+:call dein#update()' '+q'
```

## NeoVim

```sh
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

## Vim

```sh
pip3 install neovim
```

## Install

```sh
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
 ~/.vim/dein/repos/github.com/Shougo/dein.vim
vi +':call dein#install()' +q

npm install markdownlint-cli esformatter eslint js-beautify
vi +':call dein#update()' +q
```

## Links

- [vim-lsp の導入コストを下げるプラグイン vim-lsp-settings を書いた](https://qiita.com/mattn/items/e62b9f16bc487a271a7f)
