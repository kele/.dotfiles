if [ -z "$SOUND_INCLUDED" ]
then

SOUND_INCLUDED="yes"

source ${WORKING_PATH}/submodules/mod.sh
source ${WORKING_PATH}/submodules/i3_refresh.sh
source ${WORKING_PATH}/submodules/sound_commands.sh

cat << EndOfConfig
# INCLUDE: submodules/sound.sh

bindsym XF86AudioRaiseVolume exec \$RAISE_VOLUME; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+period exec \$RAISE_VOLUME; exec \$I3STATUS_REFRESH

bindsym XF86AudioLowerVolume exec \$LOWER_VOLUME ; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+comma exec \$LOWER_VOLUME; exec \$I3STATUS_REFRESH

bindsym XF86AudioMute exec \$TOGGLE_MUTE; exec \$I3STATUS_REFRESH
bindsym \$mod+Shift+m exec \$TOGGLE_MUTE; exec \$I3STATUS_REFRESH

EndOfConfig

fi
