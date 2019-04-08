if [ -z "$APPS_INCLUDED" ]
then

APPS_INCLUDED="yes"

set -e

cat << EndOfConfig
##########################################################################################
# INCLUDE: submodules/apps.sh

set \$BROWSER ${BROWSER_APP}
set \$LOCK ${WORKING_PATH}/submodules/locking/lock.sh ${WORKING_PATH}/submodules/locking/i3lock_bg
set \$TERMINAL ${TERMINAL}

EndOfConfig

if [ "${HAS_ROFI}" == "yes" ]; then

cat << EndOfConfig
set \$LAUNCHER rofi -show run
EndOfConfig

else # HAS_ROFI == "no"

cat << EndOfConfig
set \$LAUNCHER dmenu_run
EndOfConfig

fi # HAS_ROFI check

fi
