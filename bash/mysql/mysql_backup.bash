#!/bin/bash

source config.sh

mysqldump -u${username} -p${password} -A | gzip > ${backup_dir}/$(date +%Y%m%d_%H%M%S).sql.gz
