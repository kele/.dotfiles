if [ -n "$APPS_INCLUDED" ]
then
    exit 0
else

APPS_INCLUDED="yes"

set -e
source ./lock.sh

cat << EndOfConfig
set \$BROWSER google-chrome-stable
set \$LAUNCHER rofi -show run
set \$LOCK i3lock -i \$LOCK_BG
set \$TERMINAL xfce4-terminal
EndOfConfig

fi
