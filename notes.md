# notes

## Konsave working in VM
Konsave is now working in tests, so I am using this again to copy over KDE config.
Wallpapers and Icon are brought over if stored in ~/.local/share/wallpapers and ~/.local/share/icons but I am unsure if they apply automatically.

## Bambu Studio Broken Nvidia
https://github.com/bambulab/BambuStudio/issues/4626

__EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json WEBKIT_DISABLE_DMABUF_RENDERER=1 WEBKIT_FORCE_COMPOSITING_MODE=1 WEBKIT_DISABLE_COMPOSITING_MODE=1


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
