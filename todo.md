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
