#!/bin/sh

mv ~/.vim ~/.vim.bk
mv ~/.vimrc ~/.vimrc.bk
mv ~/.emacs.d ~/.emacs.d.bk
mv ~/.tmux.conf ~/.tmux.conf.bk
mv ~/.screenrc ~/.screenrc.bk

ln -s vim ~/.vim
ln -s vim/vimrc ~/.vimrc
ln -s emacs ~/.emacs.d
ln -s tmux/.tmux.conf ~/
ln -s .screenrc ~/
