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

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

PATH="/home/vagrant/.composer/vendor/bin:$PATH"

export GOPRIVATE="gitlab.yellow.virtaitech.com,gitlab.virtaitech.com"
export GOINSECURE="gitlab.yellow.virtaitech.com,gitlab.virtaitech.com"
export GONOPROXY="gitlab.yellow.virtaitech.com,gitlab.virtaitech.com"
export GOPROXY="https://goproxy.cn,direct"
export PATH="$HOME/go/bin:${PATH}"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export RUSTUP_UPDATE_ROOT="https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup"
export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

export NEUWARE_HOME="/usr/local/neuware"
export PATH="${NEUWARE_HOME}/bin:${PATH}"
#export PATH="${NEUWARE_HOME}/lib/llvm-mm/bin":$PATH
export LD_LIBRARY_PATH="${NEUWARE_HOME}/lib64:${LD_LIBRARY_PATH}"
#export LD_LIBRARY_PATH="${NEUWARE_HOME}/lib/llvm-mm/lib:${LD_LIBRARY_PATH}"

export NO_PROXY="192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,127.0.0.1,localhost,*.local"
