if [ -z "$BACKLIGHT_INCLUDED" ]
then

BACKLIGHT_INCLUDED="yes"

source ${WORKING_PATH}/submodules/mod.sh

cat << EndOfConfig
# INCLUDE: submodules/backlight.sh

bindsym \$mod+F6 exec --no-startup-id xbacklight -dec 5
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 5

bindsym \$mod+F7 exec --no-startup-id xbacklight -inc 5
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 5

EndOfConfig

fi
