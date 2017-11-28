if [ -z "$BASE16_LOOK_INCLUDED" ]
then

BASE16_LOOK_INCLUDED="yes"

source ./base16_palette.sh

cat << EndOfConfig
# INCLUDE: submodules/base16_look.sh

# Window colors
#                       border      background  text        indicator
client.focused          \$base0D     \$base0D     \$base00     \$base01
client.focused_inactive \$base02     \$base02     \$base03     \$base01
client.unfocused        \$base01     \$base01     \$base03     \$base01
client.urgent           \$base02     \$base08     \$base07     \$base08

EndOfConfig

fi
