# Visual Studio Code Settings

## Usage

Put a symlink in follow location with your OS to replace the default one, then same setting can be sync to all your environments.

- `Windows`: `%APPDATA%\Code\User\settings.json`
- `macOS`: `$HOME/Library/Application Support/Code/User/settings.json`
- `Linux`: `$HOME/.config/Code/User/settings.json`

### Example

#### macOS

```shell
git clone git@github.com:zhenxxin/env ~/Develop/env
cd ~/Library/Application\ Support/Code/User
ln -s ~/Develop/env/vscode/settings.json
ln -s ~/Develop/env/vscode/keybindings.json
```

