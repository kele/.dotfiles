set -e # Fail on errors

WORKING_PATH="$1"

if [ -z "${WORKING_PATH}" ]; then
    WORKING_PATH=`pwd`
fi

################################################################################
# SECTION: Settings
# Map CapsLock to Super (Win) key
CAPSLOCK_SUPER="yes"

# Disable DPMS (power saving) and the screensaver
DISABLE_SCREENSAVING="no"

# Whether font awesome is installed. This is used e.g. for
# workspace pseudo-icons.
HAS_FONT_AWESOME="yes"

# i3 Python API is used for smart workspace switching
# (workspace 10* is ignored while Alt-Tabbing)
HAS_I3_PYTHON="no"

# Whether the Network Manager applet should be visible in the
# tray.
HAS_NM_APPLET="yes"

# Redshift gives your eyes some rest in the evenings.
HAS_REDSHIFT="yes"

# Rofi is a launcher. Replacement for the default dmenu
# installed with i3 on Ubuntu.
HAS_ROFI="yes"

# Apps
BROWSER="firefox"
TERMINAL="xfce4-terminal"

# Polish keyboard layout.
POLISH_LAYOUT="yes"

# Wallpaper
WALLPAPER_PATH="${WORKING_PATH}/bg.jpg"

# Locking
LOCK="${WORKING_PATH}/submodules/locking/lock.sh ${WORKING_PATH}/submodules/locking/i3lock_bg"

################################################################################
# SECTION: Apps
## App launcher
if [ "${HAS_ROFI}" == "yes" ]; then
    LAUNCHER="rofi -show run"
else
    LAUNCHER="dmenu_run"
fi # HAS_ROFI check

################################################################################
# SECTION: Basics
cat << EndOfConfig
# SECTION: Basics

## Win key is the modifier
set \$mod Mod4

## Basic app bindings
bindsym \$mod+Return exec ${TERMINAL}
bindsym \$mod+w exec ${BROWSER}

## Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym \$mod+Shift+r restart

## Screen lock
bindsym \$mod+shift+o exec --no-startup-id ${LOCK}

## Start application launcher
bindsym \$mod+d exec ${LAUNCHER}

## i3status refresh
set \$I3STATUS_REFRESH killall -USR1 i3status
EndOfConfig

################################################################################
# SECTION: Restart

## Keyboard layout
if [ "${POLISH_LAYOUT}" == "yes" ]; then
    echo "exec_always setxkbmap -layout pl"
fi

## Capslock acts as Super key now
if [ "${CAPSLOCK_SUPER}" == "yes" ]; then
    echo "exec_always setxkbmap -option caps:super"
fi

## Wallpaper
if [ -n "${WALLPAPER_PATH}" ]; then
    echo "exec_always feh --bg-center ${WALLPAPER_PATH}"
fi

################################################################################
# SECTION: Screen

cat << EndOfConfig
################################################################################"
# SECTION: Screen
EndOfConfig

if [ "${DISABLE_SCREENSAVING}" == "yes" ]; then
    cat << EndOfConfig
## Disabling screensaving
exec_always xset -dpms
exec_always xset s off
EndOfConfig

fi

# Backlight control
cat << EndOfConfig
## Backlight control
bindsym \$mod+F6 exec xbacklight -dec 5
bindsym \$mod+F7 exec xbacklight -inc 5
EndOfConfig

################################################################################
# SECTION: Workspaces and navigation

cat << EndOfConfig
################################################################################
# SECTION: Workspaces and navigation
EndOfConfig

if [ "${HAS_FONT_AWESOME}" == "yes" ]; then
    cat << EndOfConfig
set \$WS1 "1: "
set \$WS2 "2: "
set \$WS3 "3: "
set \$WS4 "4: "
set \$WS7 "7: "
set \$WS8 "8: "
set \$WS9 "9: "
set \$WS10 "10: "
EndOfConfig

else # HAS_FONT_AWESOME == "no"

    cat << EndOfConfig
set \$WS1 "1: web"
set \$WS2 "2: dev"
set \$WS3 "3: web"
set \$WS4 "4: dev"
set \$WS7 "7"
set \$WS8 "8"
set \$WS9 "9"
set \$WS10 "10: org"
EndOfConfig

fi # HAS_FONT_AWESOME check

cat << EndOfConfig
## Switch to workspace
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

## Vim keybindings for changing focus
bindsym \$mod+h focus left
bindsym \$mod+j focus down
bindsym \$mod+k focus up
bindsym \$mod+l focus right

## Vim keybindings for moving windows
bindsym \$mod+shift+h move left
bindsym \$mod+shift+j move down
bindsym \$mod+shift+k move up
bindsym \$mod+shift+l move right

## Use Mouse+\$mod to drag floating windows to their wanted position
floating_modifier \$mod

## Enter fullscreen mode for the focused container
bindsym \$mod+f fullscreen

## Toggle tiling / floating
bindsym \$mod+Shift+space floating toggle

## Change focus between tiling / floating windows
bindsym \$mod+space focus mode_toggle

## Kill focused window
bindsym \$mod+shift+q kill

## Move workspace to output to the right (toggles if two workspaces).
bindsym \$mod+x move workspace to output right

## Split in vertical orientation
bindsym \$mod+v split v

## Split in horizontal orientation
bindsym \$mod+shift+v split h

## Resize mode
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

bindsym \$mod+r mode \$RESIZE_MODE

## Layout mode
set \$LAYOUT_MODE "layout: s - stacked, t - tabbed, e - split"
mode \$LAYOUT_MODE {
    bindsym s layout stacking, mode "default"
    bindsym t layout tabbed, mode "default"
    bindsym e layout toggle split, mode "default"

    bindsym Return mode "default"
    bindsym Espace mode "default"
}

bindsym \$mod+e mode \$LAYOUT_MODE

## Exit mode
set \$EXIT_MODE "System (k) lock, (l) logout, (u) suspend, (h) hibernate, (r) reboot, (s) shutdown"
mode \$EXIT_MODE {
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
bindsym \$mod+shift+x mode "\$EXIT_MODE"

## Scratchpad
bindsym \$mod+shift+i move scratchpad
bindsym \$mod+i scratchpad show
EndOfConfig

if [ "${HAS_I3_PYTHON}" == "yes" ]; then
    cat << EndOfConfig
bindsym \$mod+Tab exec ${WORKING_PATH}/scripts/next_workspace_ignore_10.py
bindsym \$mod+Shift+Tab exec ${WORKING_PATH}/scripts/prev_workspace_ignore_10.py
EndOfConfig

else # HAS_I3_PYTHON == "no"
    cat << EndOfConfig
bindsym \$mod+Tab workspace next
bindsym \$mod+Shift+Tab workspace prev
EndOfConfig

fi # HAS_I3_PYTHON check

################################################################################
# SECTION: App behavior

cat << EndOfConfig
################################################################################
# SECTION: App behavior
## Floating apps
for_window [class="Pavucontrol"] floating enable
for_window [class="Steam"] floating enable

## Borderless chrome
for_window [class="google-chrome" class="Google-chrome"] border none
EndOfConfig

################################################################################
# SECTION: Appearance
cat << EndOfConfig
################################################################################
# SECTION: Appearance

font xft:Inconsolata Medium 12

## Colors taken from github.com/tomfulghum/dotfiles
## Heavily inspired by base16-tomorrow
### Grey
set \$base00 #1d1f21
### Other shade of grey
set \$base01 #282a2e
### Lighter shade of grey
set \$base02 #373b41
### Very light grey
set \$base03 #969896
### Another light grey
set \$base04 #b4b7b4
### Even lighter grey
set \$base05 #c5c8c6
### Another very light grey
set \$base06 #e0e0e0
### White
set \$base07 #ffffff
### Light-red
set \$base08 #cc6666
### Light-orange
set \$base09 #de935f
### Lighter-orange, even yellow
set \$base0A #f0c674
### Light green
set \$base0B #b5bd68
### Light sea-blue-green
set \$base0C #8abeb7
### Light-blue
set \$base0D #81a2be
### Light violet
set \$base0E #b294bb
### Light red/brown
set \$base0F #a3685a


## Window colors
###                       border      background  text        indicator
client.focused          \$base0D     \$base0D     \$base00     \$base01
client.focused_inactive \$base02     \$base02     \$base03     \$base01
client.unfocused        \$base01     \$base01     \$base03     \$base01
client.urgent           \$base02     \$base08     \$base07     \$base08

bar {
    status_command i3status

    colors {
        background  \$base00
        separator   \$base03
        statusline  \$base05

        #                   border      background  text
        focused_workspace   \$base0D     \$base0D     \$base00
        inactive_workspace  \$base01     \$base01     \$base03
        urgent_workspace    \$base08     \$base08     \$base07
    }
}

## Thick borders
for_window [class="^.*"] border pixel 5

EndOfConfig

################################################################################
# SECTION: Sound controls

cat << EndOfConfig
################################################################################
# SECTION: Sound controls

## This relies on setting /etc/pulse/default.pa correctly.
## This involves adding 'set-default-sink NAME', where name can be found
## with 'pacm list-sinks | grep "name:".
set \$RAISE_VOLUME pactl set-sink-volume @DEFAULT_SINK@ +1%
set \$LOWER_VOLUME pactl set-sink-volume @DEFAULT_SINK@ -1%
set \$TOGGLE_MUTE pactl set-sink-mute @DEFAULT_SINK@ toggle

bindsym XF86AudioRaiseVolume exec \$RAISE_VOLUME; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+period exec \$RAISE_VOLUME; exec \$I3STATUS_REFRESH

bindsym XF86AudioLowerVolume exec \$LOWER_VOLUME ; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+comma exec \$LOWER_VOLUME; exec \$I3STATUS_REFRESH

bindsym XF86AudioMute exec \$TOGGLE_MUTE; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+m exec \$TOGGLE_MUTE; exec \$I3STATUS_REFRESH
EndOfConfig
