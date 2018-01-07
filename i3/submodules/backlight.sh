if [ -z "$BACKLIGHT_INCLUDED" ]
then

BACKLIGHT_INCLUDED="yes"

source ${WORKING_PATH}/submodules/mod.sh

cat << EndOfConfig
# INCLUDE: submodules/backlight.sh

bindsym \$mod+F6 exec xbacklight -dec 5
bindsym \$mod+F7 exec xbacklight -inc 5

EndOfConfig

fi
