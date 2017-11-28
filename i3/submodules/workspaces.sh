if [ -n "$WORKSPACES_INCLUDED" ]
then
    exit 0
else

WORKSPACES_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/workspaces.sh

set $WS1 "1: "
set $WS2 "2: "
set $WS3 "3: "
set $WS4 "4: "
set $WS7 "7: "
set $WS8 "8: "
set $WS9 "9: "
set $WS10 "10: "

EndOfConfig

fi
