### Instructions to prepare Arch for NAS usage
echo DANGER
exit 127

# Create share user
useradd -m nas
passwd nas

sue /etc/ssh/sshd_config
#> AllowUsers nas

systemctl enable --now sshd

nvim ~/.bashrc
#> exec fish

# Power Management (Laptop)
sue /etc/systemd/logind.conf.d/no-sleep-powered.conf
#> Lid switch external power = lock

sue /etc/udev/rules.d/discard.rules
#> 0bda:9210 Realtek Semiconductor Corp. RTL9210 M.2 NVME Adapter
#> ACTION=="add|change", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="9210", SUBSYSTEM=="scsi_disk", ATTR{provisioning_mode}="unmap"

cryptsetup luksFormat --key-size 256 --sector-size 4096 /dev/sdb

cryptsetup open /dev/sdb luks1
cryptsetup open /dev/sdc luks2

mkfs.btrfs -d raid1 -m raid1 /dev/mapper/luks* -L flashRaid2T 


mount /dev/mapper/luks1 /mnt

btrfs fi du /mnt
btrfs dev stats /mnt/
btrfs dev show /mnt
btrfs dev usage /mnt
btrfs fi show /dev/mapper/luks1


mkfs.btrfs -d raid1 -m raid1 /dev/mapper/luks-sdb /dev/mapper/luks-sdc -L archiveRaid
mount /dev/mapper/luks-sdb /mnt/archive

btrfs subvolume create /mnt/archive/media
btrfs subvolume create /mnt/archive/backup


# API keys etc. for docker
truncate --size 4M /root/deploy_keys
# reduced header size with 2 keyslots
cryptsetup luksFormat --luks2-metadata-size=16k --luks2-keyslots-size=512k /root/deploy_keys
cryptsetup open /root/deploy_keys keys
mkfs.ext4 /dev/mapper/keys
mount /dev/mapper/keys /root/keys
