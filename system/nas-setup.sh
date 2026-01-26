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

cryptsetup luksFormat /dev/sdb
mkfs.btrfs -d raid1 /dev/mapper/luks* -L flashRaid2T 

cryptsetup open /dev/sdb luks1
cryptsetup open /dev/sdc luks2

mount /dev/mapper/luks1 /mnt

btrfs fi du /mnt
btrfs dev stats /mnt/
btrfs dev show /mnt
btrfs dev usage /mnt
btrfs fi show /dev/mapper/luks1
