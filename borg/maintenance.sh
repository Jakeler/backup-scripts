REPO=$1

borg prune -v --list -s -n -H 6 -m 12 -y 100 $REPO
# borg prune -v --list -s  -H 6 -m 12 -y 100 $REPO

borg compact -vp $REPO


# Following is necessary after major upgrades
borg config -l $REPO
borg config $REPO max_segment_size 524288000 # default on 1.1 - 1.4

# appy changed segment size, compression (zstd,3 can do -20%), current patterns
borg recreate --chunker-params default -svp --patterns-from /mnt/software/backup-scripts/borg/pattern.lst --recompress if-different -C zstd $REPO
borg compact -vp --cleanup-commits $REPO
