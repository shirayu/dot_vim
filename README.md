# .vimrc
This is my .vimrc

## NeoVim
```
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
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
sudo pip3 install autopep8 flake8
pip3 install python-language-server
```

Type ``Shift + F`` to format.

### For Javascript
- First, install ``node.js``. Check [the latest version](https://nodejs.org/dist/latest/)
- Then, install ``eslint`` and  ``esformatter``

```
npm install -g eslint esformatter typescript typescript-language-server
```


### For C++

- see also ``lang/vimrc.cplusplus`` to complete setting

