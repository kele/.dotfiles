if [ -z "$APPS_INCLUDED" ]
then

APPS_INCLUDED="yes"

set -e
source ./lock.sh

cat << EndOfConfig
# INCLUDE: submodules/apps.sh

set \$BROWSER google-chrome-stable
set \$LAUNCHER rofi -show run
set \$LOCK i3lock -i \$LOCK_BG
set \$TERMINAL xfce4-terminal
EndOfConfig

fi
