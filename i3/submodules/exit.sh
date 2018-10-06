if [ -z "$EXIT_INCLUDED" ]
then

EXIT_INCLUDED="yes"

set -e

cat << EndOfConfig
# INCLUDE: submodules/exit.sh
#Press \$mod (super) and X to exit - check toolbar for next choices
bindsym \$mod+X mode "\$mode_system"

set \$mode_system System (k) lock, (l) logout, (u) suspend, (h) hibernate, (r) reboot, (s) shutdown
mode "\$mode_system" {
    bindsym k exec --no-startup-id ${WORKING_PATH}/scripts/i3exit.sh lock, mode "default"
    bindsym l exec --no-startup-id ${WORKING_PATH}/scripts/i3exit.sh logout, mode "default"
    bindsym u exec --no-startup-id ${WORKING_PATH}/scripts/i3exit.sh suspend, mode "default"
    bindsym h exec --no-startup-id ${WORKING_PATH}/scripts/i3exit.sh hibernate, mode "default"
    bindsym r exec --no-startup-id ${WORKING_PATH}/scripts/i3exit.sh reboot, mode "default"
    bindsym s exec --no-startup-id ${WORKING_PATH}/scripts/i3exit.sh shutdown, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

EndOfConfig

fi
