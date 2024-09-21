# notes

## DNSMASQ DISABLED
If dnsmasq starts automatically it breaks qemu/kvm as it needs to start its own instance.


#sudo systemctl enable dnsmasq 

## BTRFS
Removed any instances of subvolid from /etc/fstab. Restoring into snapshat using subvolid can result in a dead system.

btrfs-grub removed as I don't see the point of booting into a snapshot when it can be restored by command.

Snapshots completed with Timeshift.


# todo

### Konsole Fish Default

In Konsole, settings, configure Konsole,
then profile, Edit, Command : /usr/bin/fish

## Finish laptop section (after desktop is done)
### yay asusctl yay rog-control-center




