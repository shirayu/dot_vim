# .vimrc

This is my .vimrc

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

## Related softwares

### For Go

```sh
# First of all
vim +GoInstallBinaries +q
# For update
vim +GoUpdateBinaries +q
# language server
go get -u golang.org/x/tools/cmd/gopls
```

### For python

```sh
sudo apt-get -y install python3-pip
pip3 install autopep8 flake8 isort python-language-server mypy
```

Type ``Shift + F`` to format.

### For shellscript

```sh
sudo apt -y install shellcheck
GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
# or
wget https://github.com/mvdan/sh/releases/download/v3.0.2/shfmt_v3.0.2_linux_amd64 -O shfmt ; chmod a+x shfmt
```

### For Javascript

- First, install ``node.js``. Check [the latest version](https://nodejs.org/dist/latest/)
- Then, install ``eslint`` and  ``esformatter``

```sh
npm install -g eslint esformatter typescript typescript-language-server
```

### For C++

- see also ``lang/vimrc.cplusplus`` to complete setting

### For Markdown

```sh
npm install -g markdownlint-cli
```

### For YAML

```sh
pip3 install yamllint
```
