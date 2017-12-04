if [ -z "$XFCE_INCLUDED" ]
then

XFCE_INCLUDED="yes"

set -e

cat << EndOfConfig
# INCLUDE: submodules/xfce.sh

exec xfconfd
exec xfsettingsd
exec xfce4-volumed
exec xfce4-power-manager

EndOfConfig

fi
