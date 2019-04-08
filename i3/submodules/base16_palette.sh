if [ -z "$BASE16_PALETTE_INCLUDED" ]
then

BASE16_PALETTE_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/base16_palette.sh.sh

# Colors taken from github.com/tomfulghum/dotfiles
# Heavily inspired by base16-tomorrow
# Grey
set \$base00 #1d1f21
# Other shade of grey
set \$base01 #282a2e
# Lighter shade of grey
set \$base02 #373b41
# Very light grey
set \$base03 #969896
# Another light grey
set \$base04 #b4b7b4
# Even lighter grey
set \$base05 #c5c8c6
# Another very light grey
set \$base06 #e0e0e0
# White
set \$base07 #ffffff
# Light-red
set \$base08 #cc6666
# Light-orange
set \$base09 #de935f
# Lighter-orange, even yellow
set \$base0A #f0c674
# Light green
set \$base0B #b5bd68
# Light sea-blue-green
set \$base0C #8abeb7
# Light-blue
set \$base0D #81a2be
# Light violet
set \$base0E #b294bb
# Light red/brown
set \$base0F #a3685a

EndOfConfig

fi
