if [ -z "$RELOAD_CONFIG_INCLUDED" ]
then

RELOAD_CONFIG_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/reload_config.sh

set \$RELOAD_CONFIG exec ./genconfig_private_desktop.sh $WORKING_PATH > $WORKING_PATH/config; restart

EndOfConfig

fi
