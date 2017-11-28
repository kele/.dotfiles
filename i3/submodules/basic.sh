if [ -n "$BASIC_INCLUDED" ]
then
    exit 0
else

BASIC_INCLUDED="yes"

set -e
source ./mod.sh
source ./apps.sh
source ./resize_mode.sh
source ./workspaces.sh
source ./layout_mode.sh

cat << EndOfConfig
# INCLUDE: submodules/basic.sh

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

# Start application launcher
bindsym \$mod+d exec \$LAUNCHER

# Resize mode
bindsym \$mod+r mode \$RESIZE_MODE

# Layout mode
bindsym \$mod+e mode \$LAYOUT_MODE

# Screen lock
bindsym \$mod+shift+o exec --no-startup-id \$LOCK

# App hotkeys
bindsym \$mod+Return exec \$TERMINAL
bindsym \$mod+w exec \$BROWSER

# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym \$mod+Shift+r restart

EndOfConfig

fi
