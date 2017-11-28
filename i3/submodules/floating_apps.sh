if [ -n "$FLOATING_APPS_INCLUDED" ]
then
    exit 0
else

FLOATING_APPS_INCLUDED="yes"

cat << EndOfConfig
for_window [class="Pavucontrol"] floating enable
for_window [class="Steam"] floating enable

EndOfConfig

fi
