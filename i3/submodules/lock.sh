if [ -z "$LOCK_INCLUDED" ]
then

LOCK_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/lock.sh

set \$LOCK_BG ~/.config/i3/i3lock_bg.png

EndOfConfig

fi
