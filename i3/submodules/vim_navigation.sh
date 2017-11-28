if [ -z "$VIM_NAVIGATION_INCLUDED" ]
then

VIM_NAVIGATION_INCLUDED="yes"

source ./mod.sh

cat << EndOfConfig
# INCLUDE: submodules/vim_navigation.sh

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
