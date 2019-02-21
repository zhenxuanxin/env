#!/bin/bash
# clone repository
git clone git@github.com:zhenxxin:env.git ~/Develop/env
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link .vimrc
ln -s ~/Develop/env/vim/.vimrc ~/.vimrc

# install vim plugins
vim +PluginInstall +qall

