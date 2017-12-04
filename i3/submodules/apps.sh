if [ -z "$APPS_INCLUDED" ]
then

APPS_INCLUDED="yes"

set -e

cat << EndOfConfig
# INCLUDE: submodules/apps.sh

set \$BROWSER google-chrome-stable
set \$LAUNCHER dmenu_run
set \$LOCK ${WORKING_PATH}/submodules/locking/lock.sh ${WORKING_PATH}/submodules/locking/i3lock_bg
set \$TERMINAL xfce4-terminal
EndOfConfig

fi
