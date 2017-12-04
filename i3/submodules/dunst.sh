if [ -z "$DUNST_INCLUDED" ]
then

DUNST_INCLUDED="yes"

set -e

cat << EndOfConfig
# INCLUDE: submodules/dunst.sh

# Notifications daemon
exec dunst

EndOfConfig

fi
