# notes

## Konsave working in VM
Konsave is now working in tests, so I am using this again to copy over KDE config.
Wallpapers and Icon are brought over if stored in ~/.local/share/wallpapers and ~/.local/share/icons but I am unsure if they apply automatically.

## Bambu Studio Broken Nvidia - Not required now finally using AMD
https://github.com/bambulab/BambuStudio/issues/4626

__EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json WEBKIT_DISABLE_DMABUF_RENDERER=1 WEBKIT_FORCE_COMPOSITING_MODE=1 WEBKIT_DISABLE_COMPOSITING_MODE=1

## Finish laptop section (after desktop is done)
yay asusctl yay rog-control-center

## Change PKGBuild settings
Remove debug packages after installed - Adjust PKGBuild settings to not install them in the first place though
pacman -Q | grep -P '\-debug' | awk '{print $1}' | yay -Rns - < /dev/null
