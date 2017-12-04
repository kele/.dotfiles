set -ex

RESOLUTION=`xrandr | grep "*" | sed 's/^[ \t]*//;s/[ \t]*$//' | cut -d' ' -f1`
HEIGHT=`echo ${RESOLUTION} | cut -d'x' -f2`

IMG_FILENAME="${1}_${HEIGHT}.png"

if [ ! -f "${IMG_FILENAME}" ]; then
    notify-send "Missing i3lock file: ${IMG_FILENAME}"
else
    i3lock -i "${IMG_FILENAME}"
fi
