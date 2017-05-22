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
```
go get -u github.com/nsf/gocode
go get -u code.google.com/p/rog-go/exp/cmd/godef
```

### For python

```sh
sudo pip3 install autopep8 pylint
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

