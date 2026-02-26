# Run by automatic-backup.timer weekly
# Monitored by telegraf.inputs.systemd_units / grafana
set -euo pipefail

BACKUP_USER=jk
SCRIPT_PATH=/mnt/software/backup-scripts

cd $SCRIPT_PATH/docker/monitoring/
bash backup.sh # export influxdb and copy configs

source /root/keys/borg.env
export BORG_PASSPHRASE

cd $SCRIPT_PATH/borg/
sudo -u $BACKUP_USER -E bash nas-pc.sh
sudo -u $BACKUP_USER -E bash immich.sh
sudo -u $BACKUP_USER -E bash phone.sh

cd $SCRIPT_PATH/system/
bash snapper-archive.sh


cd $SCRIPT_PATH
export RCLONE_CONFIG=/root/keys/rclone-b2.conf
bash rclone-all.sh
