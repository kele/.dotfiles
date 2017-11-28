if [ -z "$MOD_INCLUDED" ]
then

MOD_INCLUDED="yes"

cat << EndOfConfig
# INCLUDE: submodules/mod.sh

# Win key modifier
set \$mod Mod4

EndOfConfig

fi
