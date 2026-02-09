echo "Unlocking main storage x2"
cryptsetup open /dev/nvme0n1 luks0
cryptsetup open /dev/nvme1n1 luks1

mount /dev/mapper/luks0 /mnt

#btrfs fi du /mnt
btrfs dev stats /mnt/
btrfs dev usage /mnt
btrfs fi show /mnt



echo "Unlocking archive storage x2"
cryptsetup open /dev/sdb luks-sdb
cryptsetup open /dev/sdc luks-sdc

mount /dev/mapper/luks-sdb /mnt/archive

#btrfs fi du /mnt
btrfs dev stats /mnt/archive
btrfs dev usage /mnt/archive
btrfs fi show /mnt/archive



echo "Unlocking deploy (cf) keys"
cryptsetup open /mnt/backup/backup-scripts/docker/certs/deploy_keys keys
mount /dev/mapper/keys /root/keys


echo "Launching docker services"
systemctl start docker.service
