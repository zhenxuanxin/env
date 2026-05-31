# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"

. "$HOME/.profile"

#eval "$(/usr/local/bin/brew shellenv)"
# 缓存 brew shellenv，每天更新一次
if [[ ! -f ~/.zsh_brew_shellenv ]] || [[ -n ~/.zsh_brew_shellenv(#qN.mh+24) ]]; then
  /usr/local/bin/brew shellenv > ~/.zsh_brew_shellenv
fi
source ~/.zsh_brew_shellenv

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"
