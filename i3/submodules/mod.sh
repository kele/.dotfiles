if [ -n "$MOD_INCLUDED" ]
then
    exit 0
else

MOD_INCLUDED="yes"

cat << EndOfConfig
# Win key modifier
set \$mod Mod4

EndOfConfig

fi
