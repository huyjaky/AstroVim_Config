#!/bin/bash

current_monitor=$(hyprctl activewindow | grep 'monitor' | awk '{print $2}') 
export PRIMARY_MONITOR_WORKSPACE=$((PRIMARY_MONITOR_WORKSPACE-2))
export SECONDARY_MONITOR_WORKSPACE=$((SECONDARY_MONITOR_WORKSPACE-2))

if [ "$PRIMARY_MONITOR_WORKSPACE" -lt 1 ]; then
  export PRIMARY_MONITOR_WORKSPACE=1
  exit 1
elif [ "$SECONDARY_MONITOR_WORKSPACE" -gt 10 ]; then 
  export SECONDARY_MONITOR_WORKSPACE=10
  exit 1
fi


hyprctl dispatch focusmonitor 0
# hyprctl dispatch fullscreenstate 0
hyprctl dispatch workspace $PRIMARY_MONITOR_WORKSPACE

hyprctl dispatch focusmonitor 1
# hyprctl dispatch fullscreenstate 0
hyprctl dispatch workspace $SECONDARY_MONITOR_WORKSPACE
# hyprctl dispatch workspace 4

hyprctl dispatch focusmonitor $current_monitor
