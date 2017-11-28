if [ -n "$SOUND_INCLUDED" ]
then
    exit 0
else

SOUND_INCLUDED="yes"

source ./mod.sh
source ./i3_refresh.sh
source ./sound_commands.sh

cat << EndOfConfig
bindsym XF86AudioRaiseVolume exec \$RAISE_VOLUME; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+period exec \$RAISE_VOLUME; exec \$I3STATUS_REFRESH

bindsym XF86AudioLowerVolume exec \$LOWER_VOLUME ; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+comma exec \$LOWER_VOLUME; exec \$I3STATUS_REFRESH

bindsym XF86AudioMute exec \$TOGGLE_MUTE; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+m exec \$TOGGLE_MUTE; exec \$I3STATUS_REFRESH

EndOfConfig

fi
