if [ -z "$RELOAD_CONFIG_INCLUDED" ]
then

RELOAD_CONFIG_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/reload_config.sh

set \$RELOAD_CONFIG exec pushd ~/.config/i3 && ./genconfig_private_desktop.sh > config && popd; restart

EndOfConfig

fi
