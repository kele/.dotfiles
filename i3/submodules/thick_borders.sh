if [ -n "$THICK_BORDERS_INCLUDED" ]
then
    exit 0
else

THICK_BORDERS_INCLUDED="yes"

cat << EndOfConfig
for_window [class="^.*"] border pixel 3

EndOfConfig

fi
