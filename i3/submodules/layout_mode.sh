if [ -n "$LAYOUT_MODE_INCLUDED" ]
then
    exit 0
else

LAYOUT_MODE_INCLUDED="yes"

cat << EndOfConfig
# Change container layout (stacked, tabbed, toggle split)
set \$LAYOUT_MODE "layout: s - stacked, t - tabbed, e - split"
mode \$LAYOUT_MODE {
    bindsym s layout stacking, mode "default"
    bindsym t layout tabbed, mode "default"
    bindsym e layout toggle split, mode "default"

    bindsym Return mode "default"
    bindsym Espace mode "default"
}

EndOfConfig

fi
