pushd ~/.config/i3
./genconfig_private_desktop.sh > config
popd

exec i3
