#!/bin/bash

source config.sh

find ${backup_dir} -name *.sql -type f -mtime +30 -exec rm {} \; > /dev/null 2>&1
