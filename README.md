#.vimrc
This is my .vimrc

## Related softwares

### For Go
```
go get -u github.com/nsf/gocode
go get -u code.google.com/p/rog-go/exp/cmd/godef
```

### For python
For python format, install ``autopep8`` in ``~/local/bin`` which ``$PATH`` includes.

```
mkdir ~/local
ln -s ~/local/ ~/.local
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py -O /tmp/get-pip.py
python /tmp/get-pip.py --user
pip install setuptools --upgrade --user
pip install autopep8 --user
```
- Type ``Shift + F`` to format

### For Javascript
Install ``jshint`` and  ``js-beautify``

- install ``node.js``
    - Check [the latest version](https://nodejs.org/dist/latest/)
```
wget https://nodejs.org/dist/latest/node-v4.0.0-linux-x64.tar.gz
tar -C ~/local xf node-v4.0.0-linux-x64.tar.gz
npm install -g jshint
npm install -g js-beautify
```


### For C++

- see also ``lang/vimrc.cplusplus`` to complete setting

