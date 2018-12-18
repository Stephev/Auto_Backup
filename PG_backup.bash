#!/bin/bash

back="/data/sas_pgbackup/"`date -d '-2 week' +%Y-%m-%d`

backf="/data/sas_pgbackup/"`date +%F`"/base.tar"
echo "starting backup....."
pg_basebackup -D /data/sas_pgbackup/`date +%F` -x -R -P -F t -U postgres
if [ -f "$backf" ]; then
    echo "success backup to $backf"
        if [ -d "$back" ]; then
                rm -rf $back
        echo "success rm $back"
        else
                echo "the old backup file not exists!"
        fi
else
    echo "backup failed, because of the file $backf not found"
fi
