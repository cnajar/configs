Own Configs
===========

VIMRC
-----

This is how I configure VIM. But VIM can be a pain to configure, that's why I will describe how to get a powerful VIM environment set up


### Vundle

I user Vundle as extension managers. Vundle is short for Vim bundle and is a Vim plugin manager.
Let’s get Vundle installed:

```
$ touch ~/.vimrc
$ mkdir -p ~/.vim/bundle/
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Editing ~/.vimrc 
```
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
```

Then start VIM and run:
```
:PluginInstall
```

