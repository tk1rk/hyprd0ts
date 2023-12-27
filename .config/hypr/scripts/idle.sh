timeout 300 '~/.config/hypr/scripts/lock.sh' 
timeout 600 'hyprctl dispatch dpms off' resume '~/.config/hypr/scripts/resume.sh' 
before-sleep '~/.config/hypr/scripts/lock.sh' 
after-resume '~/.config/hypr/scripts/lock.sh'
