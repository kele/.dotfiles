[ -f ~/.xprofile ] && . ~/.xprofile

pushd ~/.config/i3

./genconfig_private_dekstop.sh > config

popd

exec i3
