if [ -z "$CHROME_NO_BORDERS_INCLUDED" ]
then

CHROME_NO_BORDERS_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/chrome_no_borders.sh

for_window [class="google-chrome" class="Google-chrome"] border none

EndOfConfig

fi
