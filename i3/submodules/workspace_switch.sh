if [ -z "$SMART_WORKSPACE_SWITCH_INCLUDED" ]
then

SMART_WORKSPACE_SWITCH_INCLUDED="yes"

if [ "${HAS_I3_PYTHON}" == "yes" ]; then
cat << EndOfConfig
################################################################################
# INCLUDE: submodules/smart_workspace_switch.sh

bindsym \$mod+Tab exec ${WORKING_PATH}/scripts/next_workspace_ignore_10.py
bindsym \$mod+Shift+Tab exec ${WORKING_PATH}/scripts/prev_workspace_ignore_10.py

EndOfConfig

else # HAS_I3_PYTHON == "no"
cat << EndOfConfig
# INCLUDE: submodules/smart_workspace_switch.sh

bindsym \$mod+Tab workspace next
bindsym \$mod+Shift+Tab workspace prev

EndOfConfig


fi # HAS_I3_PYTHON check

fi
