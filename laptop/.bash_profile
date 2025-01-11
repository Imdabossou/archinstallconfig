#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# SET NVIDIA AS PRIMARY CARD TO FIX EXTERNAL DISPLAYS
export KWIN_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1

# SET AMD CARD AS PRIMARY FOR BATTERY LIFE
#export KWIN_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0
