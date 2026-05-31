# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/profile.pre.bash"

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$HOME/.composer/vendor/bin:$PATH"

export GOPRIVATE="git.lab.tp,gitlab.yellow.virtaitech.com,gitlab.virtaitech.com"
export GOINSECURE="git.lab.tp,gitlab.yellow.virtaitech.com,gitlab.virtaitech.com"
export GONOPROXY="git.lab.tp,gitlab.yellow.virtaitech.com,gitlab.virtaitech.com"
export GOPROXY="https://goproxy.cn,direct"
export PATH="$HOME/go/bin:${PATH}"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

export RUSTUP_UPDATE_ROOT="https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup"
export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
# lazy load nvm，只有真正用到 nvm/node/npm 时才加载
function nvm() {
  unfunction nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm "$@"
}
function node() { nvm use --silent; node "$@" }
function npm()  { nvm use --silent; npm "$@" }
function npx()  { nvm use --silent; npx "$@" }

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

export NEUWARE_HOME="/usr/local/neuware"
export PATH="${NEUWARE_HOME}/bin:${PATH}"
#export PATH="${NEUWARE_HOME}/lib/llvm-mm/bin":$PATH
export LD_LIBRARY_PATH="${NEUWARE_HOME}/lib64:${LD_LIBRARY_PATH}"
#export LD_LIBRARY_PATH="${NEUWARE_HOME}/lib/llvm-mm/lib:${LD_LIBRARY_PATH}"

export NO_PROXY="192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,127.0.0.1,localhost,*.local"

[ -f "$HOME/.env" ] && . "$HOME/.env"

function myip() {
    curl https://myip.ipip.net/
}

# To handle deletion operations safely, replace the rm command
# with an operating system-specific command such as mv or trash.
function rm() {
    # 把参数分成 flags 和 paths 两组
    local flags=()
    local paths=()
    for arg in "$@"; do
        if [[ "$arg" == -* ]]; then
            flags+=("$arg")
        else
            paths+=("$arg")
        fi
    done
    case $(uname -s) in
        Darwin)
            if command -v trash > /dev/null; then
                echo "rm is alias to trash"
                trash "${paths[@]}"
            else
                mkdir -p ~/.trash
                if command -v gmv > /dev/null; then
                    echo "rm is alias to gmv -v -t"
                    gmv -v -t ~/.trash/ "${paths[@]}"
                else
                    echo "rm is alias to mv -v"
                    mv -v "${paths[@]}" ~/.trash/
                fi
            fi
            ;;
        Linux)
            echo "rm is alias to mv -v -t"
            mv -v -t ~/.trash/ "${paths[@]}"
            ;;
    esac
}

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/profile.post.bash"
