# env

Personal development environment configuration — dotfiles, editor settings, shell configs, and utility scripts.

## Directory Structure

```
.
├── awk/          AWK utility scripts
├── bash/         Shell scripts and initialization helpers
│   └── mysql/    MySQL backup/cleanup scripts
├── bat/          Windows batch files
├── git/          Git global config and hooks
│   ├── hooks/    Pre-commit and other Git hooks
│   └── templates/ Commit message templates
├── vim/          Vim configuration
└── vscode/       Visual Studio Code settings and keybindings
```

Root-level dotfiles (`.bashrc`, `.zshrc`, `.profile`, `.vimrc`-equivalent, etc.) are symlinked into `$HOME` during setup.

## Quick Setup

Clone the repo first:

```sh
git clone git@github.com:zhenxuanxin/env.git ~/Develop/env
cd ~/Develop/env
```

Then run the initialization script to create all symlinks:

```sh
bash bash/init.bash
```

### Manual Symlinks

#### Git

```sh
ln -s ~/Develop/env/git/config ~/.gitconfig
```

#### Vim

```sh
ln -s ~/Develop/env/vim/.vimrc ~/.vimrc
vim +PluginInstall +qall
```

#### Visual Studio Code

| OS      | Settings path |
|---------|---------------|
| macOS   | `$HOME/Library/Application Support/Code/User/` |
| Linux   | `$HOME/.config/Code/User/` |
| Windows | `%APPDATA%\Code\User\` |

```sh
# macOS example
cd "$HOME/Library/Application Support/Code/User"
ln -s ~/Develop/env/vscode/settings.json
ln -s ~/Develop/env/vscode/keybindings.json
```

#### Shell

Source the desired config files from your `~/.bashrc` or `~/.zshrc`:

```sh
source ~/Develop/env/.profile
```

## Subdirectory Details

| Directory | Contents |
|-----------|----------|
| `bash/`   | `init.bash` — one-shot setup script; miscellaneous shell utilities |
| `git/`    | Global Git config; pre-commit hook (PHP CodeSniffer); commit template |
| `vim/`    | `.vimrc` with Vundle plugin management |
| `vscode/` | `settings.json` and `keybindings.json` for VS Code |
| `awk/`    | `git_stat.awk` — git contribution statistics |
| `bat/`    | Windows batch helpers |
