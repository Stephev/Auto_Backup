#!/bin/bash
date=$(date -d '+0 days' '+%Y-%m-%d')
cd /data/uploadfiles_backup
mkdir $date     
cp -r /data/uploadfiles_backup/*  $date
scp $date  root@192.168.2.232:~/backup/
if [ $? -ne 0 ]; then
    echo $(date "+%Y-%m-%d-%H:%M") "backup failed"  > /data/uploadfiles_backup/log/$date1.backup.log
    exit
else
    rm -rf  $date*  
    ssh postgres@192.168.2.232  "rm -f ~/backup/$(date -d '-2 weeks' '+%Y-%m-%d')"
    echo $(date "+%Y-%m-%d-%H:%M")  "backup succeed" > /data/uploadfiles_backup/log/$date1.backup.log
fi
