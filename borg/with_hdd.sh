# Mount archive HDDs only on demand, to save power and reduce wear
# they spin down after 5 mins: hdparm -B 127 -S 60 /dev/sdc, check: hdparm -C /dev/sdb /dev/sdc
mount /dev/mapper/luks-sdb /mnt/archive
btrfs fi show /mnt/archive

# Usage example: bash with_hdd.sh immich.sh
## running backup script here
bash "$1"

# snapshot and exit
snapper -c archive-backup --iso create -c timeline
snapper -c archive-backup --iso ls

umount /mnt/archive
