#!/bin/bash
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

backup_and_link() {
    local src="$1" dst="$2"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "${dst}.bak"
        echo "Backed up $dst -> ${dst}.bak"
    fi
    ln -sf "$src" "$dst"
    echo "Linked $dst -> $src"
}

# shell
backup_and_link "$REPO/.bash_profile" ~/.bash_profile
backup_and_link "$REPO/.bashrc"       ~/.bashrc
backup_and_link "$REPO/.bash_aliases" ~/.bash_aliases
backup_and_link "$REPO/.profile"      ~/.profile
backup_and_link "$REPO/.zshrc"        ~/.zshrc
backup_and_link "$REPO/.zprofile"     ~/.zprofile
backup_and_link "$REPO/.inputrc"      ~/.inputrc

# package managers
backup_and_link "$REPO/.npmrc"  ~/.npmrc
backup_and_link "$REPO/.yarnrc" ~/.yarnrc

# vim
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
backup_and_link "$REPO/vim/.vimrc" ~/.vimrc
vim +PluginInstall +qall

# git
backup_and_link "$REPO/git/config" ~/.gitconfig

# vscode
mkdir -p ~/.config/Code/User
backup_and_link "$REPO/vscode/settings.json"    ~/.config/Code/User/settings.json
backup_and_link "$REPO/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
