if [ -n "$BASE16_PALETTE_INCLUDED" ]
then
    BASE16_PALETTE_INCLUDED="yes"
else

cat << EndOfConfig
# Colors taken from github.com/tomfulghum/dotfiles
# Heavily inspired by base16-tomorrow
set \$base00 #1d1f21
set \$base01 #282a2e
set \$base02 #373b41
set \$base03 #969896
set \$base04 #b4b7b4
set \$base05 #c5c8c6
set \$base06 #e0e0e0
set \$base07 #ffffff
set \$base08 #cc6666
set \$base09 #de935f
set \$base0A #f0c674
set \$base0B #b5bd68
set \$base0C #8abeb7
set \$base0D #81a2be
set \$base0E #b294bb
set \$base0F #a3685a

EndOfConfig

fi