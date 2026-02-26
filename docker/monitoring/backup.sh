set -euo pipefail
# If lost get operator token (initial token), all access from webui is not enough for backups
# docker compose down
# tools/influxd recovery auth create-operator --bolt-path db2/influxd.bolt --org myOrg --username jake

# source .env
# tools/influx config create --config-name op \
#                     --host-url "http://nas-server:8086" \
#                     --org "myOrg" \
#                     --token $INFLUX_OPERATOR_TOKEN \
#                     --active


BACKUP_DIR=backup # relative path in docker/monitoring
rm -r $BACKUP_DIR
mkdir -p $BACKUP_DIR

tools/influx backup -b env/autogen backup/env_$(date --iso-8601)
tools/influx backup -b db/autogen backup/db_$(date --iso-8601)

# rsync -a --info=PROGRESS2 /etc/snapper /etc/telegraf/telegraf.conf grafana/grafana.ini grafana/grafana.db $BACKUP_DIR/ 
# rsync SElinux problematic, cant write even with tmp_t, rsync_tmp_t, mnt_t - workaround = cp
cp -r /etc/snapper /etc/telegraf/telegraf.conf grafana/grafana.ini grafana/grafana.db $BACKUP_DIR/

chown -R jk:users $BACKUP_DIR
du -h $BACKUP_DIR
