#!/bin/sh

mv ~/.vim ~/.vim.bk
mv ~/.vimrc ~/.vimrc.bk
mv ~/.emacs.d ~/.emacs.d.bk
mv ~/.tmux.conf ~/.tmux.conf.bk
mv ~/.screenrc ~/.screenrc.bk

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/emacs ~/.emacs.d
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/.screenrc ~/
