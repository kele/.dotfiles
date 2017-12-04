if [ -z "$WORKSPACES_INCLUDED" ]
then

WORKSPACES_INCLUDED="yes"

if [ "${HAS_FONT_AWESOME}" == "yes" ]; then
cat << EndOfConfig
# INCLUDE: submodules/workspaces.sh

set \$WS1 "1: "
set \$WS2 "2: "
set \$WS3 "3: "
set \$WS4 "4: "
set \$WS7 "7: "
set \$WS8 "8: "
set \$WS9 "9: "
set \$WS10 "10: "

EndOfConfig

else # HAS_FONT_AWESOME == "no"

cat << EndOfConfig
# INCLUDE: submodules/workspaces.sh

set \$WS1 "1: web"
set \$WS2 "2: dev"
set \$WS3 "3: web"
set \$WS4 "4: dev"
set \$WS7 "7"
set \$WS8 "8"
set \$WS9 "9"
set \$WS10 "10: mail&cal"

EndOfConfig

fi # HAS_FONT_AWESOME check

fi
