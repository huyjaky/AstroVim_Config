# Get the window identifiers from hyprctl clients
window_ids=$(hyprctl clients | grep 'pid:' | awk '{print $2}')
prev_monitor=$(hyprctl clients | grep 'monitor:' | awk '{print $2}')

hyprctl dispatch movewindow r
current_monitor=$(hyprctl clients | grep 'monitor:' | awk '{print $2}')

if [[ $prev_monitor != $current_monitor ]]
  then
    # Loop through each window ID and set it to fullscreen
    for win_id in $window_ids
    do
      hyprctl dispatch fullscreenstate 0 $win_id
      echo done
    done
  else
      hyprctl dispatch fullscreenstate 0
fi


