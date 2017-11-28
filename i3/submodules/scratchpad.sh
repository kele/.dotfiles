if [ -n "$SCRATCHPAD_INCLUDED" ]
then
    exit 0
else

SCRATCHPAD_INCLUDED="yes"

source ./mod.sh

cat << EndOfConfig
# Scratchpad
bindsym \$mod+shift+i move scratchpad
bindsym \$mod+i scratchpad show

EndOfConfig

fi
