if [ -n "$RESIZE_MODE_INCLUDED" ]
then
    exit 0
else

RESIZE_MODE_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/resize_mode.sh

# Resize window (you can also use the mouse for that)
set \$RESIZE_MODE "resize"
mode \$RESIZE_MODE {
    bindsym Left resize shrink width 10 px or 10 ppt
    bindsym Down resize grow height 10 px or 10 ppt
    bindsym Up resize shrink height 10 px or 10 ppt
    bindsym Right resize grow width 10 px or 10 ppt

    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt

    bindsym Shift+Left resize shrink width 100 px or 100 ppt
    bindsym Shift+Down resize grow height 100 px or 100 ppt
    bindsym Shift+Up resize shrink height 100 px or 100 ppt
    bindsym Shift+Right resize grow width 100 px or 100 ppt

    bindsym Shift+h resize shrink width 100 px or 100 ppt
    bindsym Shift+j resize grow height 100 px or 100 ppt
    bindsym Shift+k resize shrink height 100 px or 100 ppt
    bindsym Shift+l resize grow width 100 px or 100 ppt

    bindsym Return mode "default"
    bindsym Escape mode "default"
}

EndOfConfig

fi
