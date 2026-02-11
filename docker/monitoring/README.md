### Backup creation
```sh
docker exec -it influxdb bash

# new shell inside container
cd /backup
influx backup -b db/autogen $DATE_name
influx backup -b env/autogen $DATE_name
```

### Backup restore
Set init env vars, start influx:
```sh
docker exec -it influxdb bash

# new shell inside container
cd /backup
influx restore $DATE_name
...

# show create the buckets
influx bucket ls
# map to use v1 compat endpoints
influx v1 dbrp create --db db --bucket-id $ID_BUCKET_LIST --rp gg
influx v1 dbrp create --db env --bucket-id $ID_BUCKET_LIST --rp gg
```

### Grafana v1 access
Create Data - API token, insert as custom header in data source:
```
Authorization: Token $VALUE
```
