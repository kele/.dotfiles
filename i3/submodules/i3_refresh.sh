if [ -z "$I3REFRESH_INCLUDED" ]
then

I3REFRESH_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/i3_refresh.sh

set \$I3STATUS_REFRESH killall -USR1 i3status

EndOfConfig

fi
