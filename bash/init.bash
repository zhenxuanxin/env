#!/bin/bash
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# clone vim plugin manager
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link .vimrc
ln -s "$REPO/vim/.vimrc" ~/.vimrc

# install vim plugins
vim +PluginInstall +qall

# link .gitconfig
ln -s "$REPO/git/config" ~/.gitconfig

# link vscode
ln -s "$REPO/vscode/settings.json" ~/.config/Code/User/settings.json
ln -s "$REPO/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
