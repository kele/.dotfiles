if [ -n "$CHROME_NO_BORDERS_INCLUDED" ]
then
    exit 0
else

CHROME_NO_BORDERS_INCLUDED="yes"

cat << EndOfConfig
for_window [class="google-chrome" class="Google-chrome"] border none

EndOfConfig

fi
