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
This command will download all the plugins and installing them for you.


### Python Indentation

First you have to add the proper PEP 8 indentation, add the following to your .vimrc
```
" Python Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix
```

Then you can use the indentpython.vim extension, add to your .vimrc
```
" Python Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'
```


### Auto-Complete

For Python auto-completing, I use YouCompleteMe. Use Vundle to install it:
```
" Auto-Complete
Bundle 'Valloric/YouCompleteMe'
```

To finish installation, please follow the [installation instructions]( https://github.com/ycm-core/YouCompleteMe/blob/master/README.md#installation)


### Pipenv / Virtualenv Support

By default, VIM doesn’t know anything about pipenv / virtualenv, so you have to make VIM and YouCompleteMe aware of your virtualenv by adding the following lines of code to .vimrc:

```
"python with pipenv / virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
```
