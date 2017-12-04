if [ -z "$BASE16_I3STATUS_INCLUDED" ]
then

BASE16_I3STATUS_INCLUDED="yes"

source ${WORKING_PATH}/submodules/base16_palette.sh
source ${WORKING_PATH}/submodules/font.sh
source ${WORKING_PATH}/submodules/mod.sh

cat << EndOfConfig
# INCLUDE: submodules/base16_i3status.sh

bar {
    status_command i3status

    colors {
        background  \$base00
        separator   \$base03
        statusline  \$base05

        #                   border      background  text
        focused_workspace   \$base0D     \$base0D     \$base00
        inactive_workspace  \$base01     \$base01     \$base03
        urgent_workspace    \$base08     \$base08     \$base07
    }
}

EndOfConfig

fi
