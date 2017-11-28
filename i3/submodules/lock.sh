if [ -n "$LOCK_INCLUDED" ]
then
    exit 0
else

LOCK_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/lock.sh

set \$LOCK_BG ~/.config/i3/i3lock_bg.png

EndOfConfig

fi
