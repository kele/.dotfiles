if [ -n "$SOUND_COMMANDS_INCLUDED" ]
then
    exit 0
else

SOUND_COMMANDS_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/sound_commands.sh

set \$RAISE_VOLUME pactl set-sink-volume 0 +1%
set \$LOWER_VOLUME pactl set-sink-volume 0 -1%
set \$TOGGLE_MUTE pactl set-sink-mute 0 toggle

EndOfConfig

fi
