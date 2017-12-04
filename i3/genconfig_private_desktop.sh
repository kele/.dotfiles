set -e # Fail on errors

WORKING_PATH="$1"

if [ -z "${WORKING_PATH}" ]; then
    WORKING_PATH=`pwd`
fi

set +x

source ${WORKING_PATH}/settings.sh

source ${WORKING_PATH}/submodules/apps.sh
source ${WORKING_PATH}/submodules/base16_i3status.sh
source ${WORKING_PATH}/submodules/base16_look.sh
source ${WORKING_PATH}/submodules/base16_palette.sh
source ${WORKING_PATH}/submodules/basic.sh
source ${WORKING_PATH}/submodules/dunst.sh
source ${WORKING_PATH}/submodules/floating_apps.sh
source ${WORKING_PATH}/submodules/font.sh
source ${WORKING_PATH}/submodules/i3_refresh.sh
source ${WORKING_PATH}/submodules/layout_mode.sh
source ${WORKING_PATH}/submodules/mod.sh
source ${WORKING_PATH}/submodules/resize_mode.sh
source ${WORKING_PATH}/submodules/scratchpad.sh
source ${WORKING_PATH}/submodules/sound.sh
source ${WORKING_PATH}/submodules/sound_commands.sh
source ${WORKING_PATH}/submodules/thick_borders.sh
source ${WORKING_PATH}/submodules/vim_navigation.sh
source ${WORKING_PATH}/submodules/workspace_switch.sh
source ${WORKING_PATH}/submodules/workspaces.sh
source ${WORKING_PATH}/submodules/xfce.sh
