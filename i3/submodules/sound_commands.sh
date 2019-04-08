if [ -z "$SOUND_COMMANDS_INCLUDED" ]
then

SOUND_COMMANDS_INCLUDED="yes"

cat << EndOfConfig
################################################################################
# INCLUDE: submodules/sound_commands.sh

# It relies on setting /etc/pulse/default.pa correctly.
# This involves adding 'set-default-sink NAME', where name can be found
# with 'pacm list-sinks | grep "name:".

set \$RAISE_VOLUME pactl set-sink-volume @DEFAULT_SINK@ +1%
set \$LOWER_VOLUME pactl set-sink-volume @DEFAULT_SINK@ -1%
set \$TOGGLE_MUTE pactl set-sink-mute @DEFAULT_SINK@ toggle

EndOfConfig

fi
