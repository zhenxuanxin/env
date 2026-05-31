alias fp="FTP_PROXY=http://127.0.0.1:7897"
alias hp="HTTP_PROXY=http://127.0.0.1:7897"
alias hps="HTTPS_PROXY=http://127.0.0.1:7897"
alias np="NO_PROXY=127.0.0.1,localhost"

alias composer="php $HOME/.local/bin/composer.phar $*"
alias phpcs="vendor/bin/phpcs"
alias phpcbf="vendor/bin/phpcbf"
alias phpmd="vendor/bin/phpmd"
alias php-cs-fixer="vendor/bin/php-cs-fixer"
alias phpunit="vendor/bin/phpunit"

# 根据操作系统判断 open 命令
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux 系统使用 gio open
    alias open="gio open"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS 系统保持原生 open，无需设置别名，这里可以留空或加注释
    :
fi

alias ctr="sudo ctr -n k8s.io"
alias nerdctl="sudo nerdctl -n k8s.io"
alias buildctl="sudo buildctl"
alias crictl="sudo crictl"
alias k3s="sudo k3s"

alias k2m="kubectl config use-context minikube"

alias mvn="JAVA_HOME=$(/usr/libexec/java_home -v 1.8) mvn"

alias codex-work="open -n -a Codex --env CODEX_HOME=$HOME/.codex-work"
