#!/usr/bin/env sh 
  
cd ~ 
  
export HYPRLAND_LOG_WLR=1 
  
export XMODIFIERS=@im=fcitx5 
export GTK_IM_MODULE=fcitx5 
export QT_IM_MODULE=fcitx5 
  
exec Hyprland

