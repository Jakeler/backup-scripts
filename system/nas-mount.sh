echo "Unlocking main storage x2"
cryptsetup open /dev/sdb luks1
cryptsetup open /dev/sdc luks2

mount /dev/mapper/luks1 /mnt

#btrfs fi du /mnt
btrfs dev stats /mnt/
btrfs dev usage /mnt
btrfs fi show /dev/mapper/luks1
