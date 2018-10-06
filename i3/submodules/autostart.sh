if [ -z "$AUTOSTART_INCLUDED" ]
then

AUTOSTART_INCLUDED="yes"

set -e

cat << EndOfConfig
# INCLUDE: submodules/autostart.sh
EndOfConfig

if [ "${HAS_REDSHIFT}" == "yes" ]; then
    echo "exec redshift-gtk -l 51:17 -t 5500:4000"
fi

if [ "${DISABLE_SCREENSAVING}" == "yes" ]; then
    echo "exec xset -dpms"
    echo "exec xset s off"
fi

if [ "${HAS_NM_APPLET}" == "yes" ]; then
    echo "exec nm-applet"
fi

if [ "${POLISH_LAYOUT}" == "yes" ]; then
    echo "exec setxkbmap -layout pl"
fi

if [ "${CAPSLOCK_SUPER}" == "yes" ]; then
    echo "exec setxkbmap -option caps:super"
fi

if [ -n "${WALLPAPER_PATH}" ]; then
    echo "exec feh --bg-center ${WALLPAPER_PATH}"
fi

if [-n "${HAS_VOLUMEICON}" == "yes" ]; then
    echo "exec volumeicon"
fi

echo ""

fi
