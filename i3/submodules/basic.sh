if [ -z "$BASIC_INCLUDED" ]
then

BASIC_INCLUDED="yes"

set -e
source ${WORKING_PATH}/submodules/apps.sh
source ${WORKING_PATH}/submodules/workspaces.sh

cat << EndOfConfig
# INCLUDE: submodules/basic.sh

################################################################################
# Win key is the modifier
set \$mod Mod4

################################################################################
# Workspaces
# Switch to workspace
bindsym \$mod+1 workspace \$WS1
bindsym \$mod+2 workspace \$WS2
bindsym \$mod+3 workspace \$WS3
bindsym \$mod+4 workspace \$WS4
bindsym \$mod+5 workspace \$WS5
bindsym \$mod+6 workspace \$WS6
bindsym \$mod+7 workspace \$WS7
bindsym \$mod+8 workspace \$WS8
bindsym \$mod+9 workspace \$WS9
bindsym \$mod+0 workspace \$WS10

# Move focused container to workspace
bindsym \$mod+Shift+1 move container to workspace \$WS1
bindsym \$mod+Shift+2 move container to workspace \$WS2
bindsym \$mod+Shift+3 move container to workspace \$WS3
bindsym \$mod+Shift+4 move container to workspace \$WS4
bindsym \$mod+Shift+5 move container to workspace \$WS5
bindsym \$mod+Shift+6 move container to workspace \$WS6
bindsym \$mod+Shift+7 move container to workspace \$WS7
bindsym \$mod+Shift+8 move container to workspace \$WS8
bindsym \$mod+Shift+9 move container to workspace \$WS9
bindsym \$mod+Shift+0 move container to workspace \$WS10

# Vim keybindings for changing focus
bindsym \$mod+h focus left
bindsym \$mod+j focus down
bindsym \$mod+k focus up
bindsym \$mod+l focus right

# Vim keybindings for moving windows
bindsym \$mod+shift+h move left
bindsym \$mod+shift+j move down
bindsym \$mod+shift+k move up
bindsym \$mod+shift+l move right

################################################################################
# Use Mouse+\$mod to drag floating windows to their wanted position
floating_modifier \$mod

# Enter fullscreen mode for the focused container
bindsym \$mod+f fullscreen

# Toggle tiling / floating
bindsym \$mod+Shift+space floating toggle

# Change focus between tiling / floating windows
bindsym \$mod+space focus mode_toggle

# Kill focused window
bindsym \$mod+shift+q kill

# Move workspace to output to the right (toggles if two workspaces).
bindsym \$mod+x move workspace to output right

# Split in vertical orientation
bindsym \$mod+v split v

# Split in horizontal orientation
bindsym \$mod+shift+v split h

################################################################################
# Start application launcher
bindsym \$mod+d exec \$LAUNCHER

################################################################################
# Resize mode
bindsym \$mod+r mode \$RESIZE_MODE

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

################################################################################
# Layout mode
bindsym \$mod+e mode \$LAYOUT_MODE

# Change container layout (stacked, tabbed, toggle split)
set \$LAYOUT_MODE "layout: s - stacked, t - tabbed, e - split"
mode \$LAYOUT_MODE {
    bindsym s layout stacking, mode "default"
    bindsym t layout tabbed, mode "default"
    bindsym e layout toggle split, mode "default"

    bindsym Return mode "default"
    bindsym Espace mode "default"
}

################################################################################
# Exit mode
bindsym \$mod+shift+x mode "\$EXIT_MODE"

set \$EXIT_MODE System (k) lock, (l) logout, (u) suspend, (h) hibernate, (r) reboot, (s) shutdown
mode \"$EXIT_MODE" {
    bindsym k exec --no-startup-id \$LOCK, mode "default"
    bindsym l exec --no-startup-id i3-msg exit, mode "default"
    bindsym u exec --no-startup-id systemctl suspend, mode "default"
    bindsym h exec --no-startup-id systemctl hibernate, mode "default"
    bindsym r exec --no-startup-id systemctl reboot, mode "default"
    bindsym s exec --no-startup-id systemctl shutdown, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

################################################################################
# Screen lock
bindsym \$mod+shift+o exec --no-startup-id \$LOCK

################################################################################
# App hotkeys
bindsym \$mod+Return exec \$TERMINAL
bindsym \$mod+w exec \$BROWSER

################################################################################
# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym \$mod+Shift+r restart

################################################################################
# Floating apps
for_window [class="Pavucontrol"] floating enable
for_window [class="Steam"] floating enable

EndOfConfig

fi
