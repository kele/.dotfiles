if [ -z "$SCRATCHPAD_INCLUDED" ]
then

SCRATCHPAD_INCLUDED="yes"

source ${WORKING_PATH}/submodules/mod.sh

cat << EndOfConfig
# INCLUDE: submodules/scratchpad.sh

# Scratchpad
bindsym \$mod+shift+i move scratchpad
bindsym \$mod+i scratchpad show

EndOfConfig

fi
