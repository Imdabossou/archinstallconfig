# notes
## desktop/config.sh - konsave removed due to issues

### #Download and apply KDE Plasma theme
#konsave would be used for CLI profile import but it does not support KDE Plasma 6... Removed until updated
#curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/konsave.knsv
#konsave -i konsave.knsv
#konsave -a konsave

## DNSMASQ DISABLED
#If dnsmasq starts automatically it breaks qemu/kvm as it needs to start its own instance
sudo systemctl enable dnsmasq

## Timeshift - issues if not configured before use

### @home subvolume not included in snapshots by default
-sudo nano/etc/fstab - remove any instances of subvolid. restoring into snapshat using subvolid results in a dead system
-sudo systemctl edit --full grub-btrfsd - ExecStart= must be edited to @ directory as it is wrong for Timeshift / archinstall default subvolumes
-Read only issue when booting snapshots from Grub.


# todo

## Finish laptop section
### yay asusctl yay rog-control-center

## Ensure BTRFS snapshots work. Testing with Timeshift first and then snapper
### GRUB BTFS snapshots with Timeshift are not working at the moment. Boot from Grub states read-only. Eventually breaks arch.
### Timeshift does not use arch directories out the box. Can try snapper
> (NO default subvolumes in archinstall)
> (WHILE IN CHROOT FROM INSTALL)
>  mk dir ./snapshots
>  snapper -c config create-config /
> To finish above
