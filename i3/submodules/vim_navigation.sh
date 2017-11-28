if [ -n "$VIM_NAVIGATION_INCLUDED" ]
then
    exit 0
else

VIM_NAVIGATION_INCLUDED="yes"

source ./mod.sh

cat << EndOfConfig
# Vim keybindings for changing focus
bindsym \$mod+h focus left
bindsym \$mod+j focus down
bindsym \$mod+k focus up
bindsym \$mod+l focus right

# Vim keybindings for moving windows
bindsym \$mod+shift+h move left
bindsym \$mod+shift+j move down
bindsym \$mod+shift+k move up
bindsym \$mod+shift+l move right

EndOfConfig

fi