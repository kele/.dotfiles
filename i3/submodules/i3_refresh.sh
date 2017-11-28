if [ -n "$I3REFRESH_INCLUDED" ]
then
    exit 0
else

I3REFRESH_INCLUDED="yes"

cat << EndOfConfig
set \$I3STATUS_REFRESH killall -USR1 i3status

EndOfConfig

fi
