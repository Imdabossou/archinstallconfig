# notes

## Konsave working in VM
Konsave is now working in tests, so I am using this again to copy over KDE config.
Wallpapers and Icon are brought over if stored in ~/.local/share/wallpapers and ~/.local/share/icons but I am unsure if they apply automatically.


## DNSMASQ DISABLED
If dnsmasq starts automatically it breaks qemu/kvm as it needs to start its own instance.


#sudo systemctl enable dnsmasq 

## BTRFS
Removed any instances of subvolid from /etc/fstab. Restoring into snapshat using subvolid can result in a dead system.

btrfs-grub removed as I don't see the point of booting into a snapshot when it can be restored by command.

Snapshots completed with Timeshift.


# todo
## Finish laptop section (after desktop is done)
### yay asusctl yay rog-control-center
