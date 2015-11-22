dot_files
=========

The name says it all

## Setup VIM
- Install gvim on Ubuntu or macvim on Mac
- Install [Vundle](https://github.com/VundleVim/Vundle.vim)
  
  ```
  $ mkdir -p ~/.vim/bundle
  $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```
- Install all vim plugins

  ```
  $ vim +PluginInstall +qall
  ```
  
  This will open up vim and start installing all the plugins. It will fetch each plugin from Github and install it one by one - so it may take up to 10 minutes.
