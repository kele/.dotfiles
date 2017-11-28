if [ -z "$THICK_BORDERS_INCLUDED" ]
then

THICK_BORDERS_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/thick_borders.sh

for_window [class="^.*"] border pixel 3

EndOfConfig

fi
