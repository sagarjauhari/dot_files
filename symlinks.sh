#!/bin/sh
git clone git@github.com:sagarjauhari/dot_files.git ~/dot_files
ln -s ~/dot_files/.vim/.vimrc ~/.vimrc
ln -s ~/dot_files/.vim/.gvimrc ~/.gvimrc
ln -s ~/dot_files/tmux.conf ~/.tmux.conf
ln -s ~/dot_files/guard.rb ~/.guard.rb
