timeout 300 '$HOME/.config/hypr/bin/lock.sh' 
timeout 600 'hyprctl dispatch dpms off' resume '$HOME/.config/hypr/bin/resume.sh' 
before-sleep '$HOME/.config/hypr/bin/lock.sh' 
after-resume '$HOME/.config/hypr/bin/lock.sh'
