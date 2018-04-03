if [ -z "$BASE16_PALETTE_INCLUDED" ]
then

BASE16_PALETTE_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/base16_palette.sh.sh

# Colors taken from github.com/tomfulghum/dotfiles
# Heavily inspired by base16-tomorrow
set \$base00 #1d1f21 # Grey
set \$base01 #282a2e # Other shade of grey
set \$base02 #373b41 # Lighter shade of grey
set \$base03 #969896 # Very light grey
set \$base04 #b4b7b4 # Another light grey
set \$base05 #c5c8c6 # Even lighter grey
set \$base06 #e0e0e0 # Another very light grey
set \$base07 #ffffff # White
set \$base08 #cc6666 # Light-red
set \$base09 #de935f # Light-orange
set \$base0A #f0c674 # Lighter-orange, even yellow
set \$base0B #b5bd68 # Light green
set \$base0C #8abeb7 # Light sea-blue-green
set \$base0D #81a2be # Light-blue
set \$base0E #b294bb # Light violet
set \$base0F #a3685a # Light red/brown

EndOfConfig

fi
