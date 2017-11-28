if [ -n "$FONT_INCLUDED" ]
then
    exit 0
else

FONT_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/font.sh

font xft:Inconsolata Medium 9

EndOfConfig

fi
