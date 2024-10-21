#!/bin/bash
# Extract workspace ID from the output of hyprctl activewindow
current_monitor=$(hyprctl activeworkspace | grep 'monitorID' | awk '{print $2}') 
current_workspace=$(hyprctl activeworkspace | grep 'workspace' | awk '{print $3}')

# Determine the second workspace based on whether the current workspace is even or odd
if [ $((current_workspace % 2)) -eq 0 ]; then
  second_workspace=$((current_workspace - 1))
else
  second_workspace=$((current_workspace + 1)) 
fi

# Assign primary and secondary monitor workspaces based on the current workspace
if [ $((current_workspace % 2)) -eq 0 ]; then
  primary_monitor_workspace=$((second_workspace + 2)) # left
  secondary_monitor_workspace=$((current_workspace + 2)) # right
else
  primary_monitor_workspace=$((current_workspace + 2))
  secondary_monitor_workspace=$((second_workspace + 2))
fi

# Check if primary_monitor_workspace is less than or equal to 0
# or if secondary_monitor_workspace is greater than or equal to 11
if [ "$primary_monitor_workspace" -le 0 ] || [ "$secondary_monitor_workspace" -ge 7 ]; then
  exit 1
fi


# Switch focus and workspace for both monitors
hyprctl dispatch focusmonitor 0
hyprctl dispatch workspace $primary_monitor_workspace

hyprctl dispatch focusmonitor 1
hyprctl dispatch workspace $secondary_monitor_workspace

# Optionally focus back to the original monitor if desired (adjust this part if needed)
hyprctl dispatch focusmonitor $current_monitor
