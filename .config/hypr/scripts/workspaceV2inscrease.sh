#!/bin/bash

# Extract workspace ID from the output of hyprctl activewindow
current_monitor=$(hyprctl activeworkspace | grep 'monitorID' | awk '{print $2}') 
current_workspace=$(hyprctl activeworkspace | grep 'workspace' | awk '{print $3}')

# Determine the second workspace based on whether the current workspace is even or odd
echo $current_workspace
echo $current_monitor

if [ $((current_workspace % 2)) -eq 0 ]; then
  second_workspace=$((current_workspace - 1))
else
  second_workspace=$((current_workspace + 1)) 
fi

primary_monitor_workspace=$((current_workspace  + 2)) # 1 + 2 =3
secondary_monitor_workspace=$((second_workspace + 2)) # 2 + 2 =4

# Check if primary_monitor_workspace is less than or equal to 0
# or if secondary_monitor_workspace is greater than or equal to 11
if [ "$primary_monitor_workspace" -le 0 ] || [ "$secondary_monitor_workspace" -ge 9 ]; then
  exit 1
fi



hyprctl --batch "
  dispatch workspace $secondary_monitor_workspace ; 
  dispatch workspace $primary_monitor_workspace ; 
"
