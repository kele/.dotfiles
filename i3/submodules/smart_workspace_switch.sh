if [ -z "$SMART_WORKSPACE_SWITCH_INCLUDED" ]
then

SMART_WORKSPACE_SWITCH_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/smart_workspace_switch.sh

bindsym \$mod+Tab exec \$WORKING_DIR/next_workspace_ignore_10.py
bindsym \$mod+Shift+Tab exec \$WORKING_DIR/prev_workspace_ignore_10.py

EndOfConfig

fi
