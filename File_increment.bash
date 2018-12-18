#!/bin/bash
echo "starting backup..."
rsync  -av  /data/uploadfiles   root@192.168.2.236:/data/sas_pgbackup/uploadfiles_backup/
if [ $? -ne 0 ]; then
    echo $(date "+%Y-%m-%d-%H:%M")  "backup failed"
else
    echo echo $(date "+%Y-%m-%d-%H:%M") "backup succeed"
fi
