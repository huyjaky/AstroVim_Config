# Get the window identifiers from hyprctl clients
window_ids=$(hyprctl clients | grep 'pid:' | awk '{print $2}')
prev_monitor=$(hyprctl clients | grep 'monitor:' | awk '{print $2}')

hyprctl dispatch movewindow l
current_monitor=$(hyprctl clients | grep 'monitor:' | awk '{print $2}')
echo $prev_monitor
echo $current_monitor

if [[ $prev_monitor != $current_monitor ]]
  then
    # Loop through each window ID and set it to fullscreen
    # for win_id in $window_ids
    # do
    #   
    #   hyprctl dispatch movefocus $win_id
    #   hyprctl dispatch fullscreenstate 0
    # done
    # 
    hyprctl dispatch bringactivetotop
  else
      hyprctl dispatch fullscreenstate 0
fi


