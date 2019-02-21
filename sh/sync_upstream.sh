#!/bin/bash

if [ 1 -gt $# ];then
    working_dir=.
else
    working_dir=$(realpath $1)
fi

alias git="git -C \"${working_dir}\""
# 暂存一下
git add . && git stash

# 回退到 master，只同步 master 分支
git checkout master

# 先同步当前仓库的最新修改
git pull origin master --rebase

# 应用上游仓库的最新修改
git pull upstream master --rebase

# 更新当前仓库
git push origin master

# 最后复原一下当前修改
git stash pop

unalias git
