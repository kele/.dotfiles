if [ -z "$FONT_INCLUDED" ]
then

FONT_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/font.sh

font xft:Droid Sans Mono 9

EndOfConfig

fi
