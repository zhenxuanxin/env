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

PATH="/home/vagrant/.composer/vendor/bin:$PATH"

export GOPROXY=https://goproxy.io
alias np="NO_PROXY=127.0.0.1,localhost"
alias hp="HTTP_PROXY=http://127.0.0.1:1080"
alias fp="FTP_PROXY=http://127.0.0.1:1080"
alias hps="HTTPS_PROXY=http://127.0.0.1:1080"

alias composer="php $HOME/.local/bin/composer.phar $*"
alias phpcs="vendor/bin/phpcs"
alias phpcbf="vendor/bin/phpcbf"
alias phpmd="vendor/bin/phpmd"
alias php-cs-fixer="vendor/bin/php-cs-fixer"
alias phpunit="vendor/bin/phpunit"

alias open="gio open"
alias rm="rm -v"

alias k2m="kubectl config use-context minikube"
alias k2dev="kubectl config use-context dev-7"
alias k2test="kubectl config use-context test-7"
