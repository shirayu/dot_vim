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

First of all
```
vim +GoInstallBinaries +q
```

For update
```
vim +GoUpdateBinaries +q
```

### For python

```sh
sudo apt-get -y install python3-pip
sudo pip3 install autopep8 flake8
```

Type ``Shift + F`` to format.

### For Javascript
- First, install ``node.js``. Check [the latest version](https://nodejs.org/dist/latest/)
- Then, install ``eslint`` and  ``esformatter``

```
npm install -g eslint esformatter
```


### For C++

- see also ``lang/vimrc.cplusplus`` to complete setting

