#!/bin/bash

# Lấy thông tin của cửa sổ hiện tại chỉ một lần
window_info=$(hyprctl activewindow)

# Trích xuất giá trị cần thiết từ window_info 
# 1892
window_x_position=$(echo "$window_info" | grep -oP '(?<=at: )\d+')
window_at_monitor=$(echo "$window_info" | grep 'monitor' | awk '{print $2}')
window_at_workspace=$(echo "$window_info" | grep 'workspace' | awk '{print $2}')
window_state=$(echo "$window_info" | grep 'fullscreen:' | awk '{print $2}')

current_workspace=$(hyprctl activeworkspace | grep 'workspace' | awk '{print $3}')
window_width=$(echo "$window_info" | grep 'size:' | awk '{print $2}' | cut -d',' -f1)

echo $window_stat
echo $window_x_position
echo $window_width

hyprctl dispatch fullscreenstate 0 # minimize trước khi di chuyển

# NOTE: Di chuyển cửa sổ nếu vị trí X vượt qua ngưỡng
if [ $window_x_position -eq 14 ] && [ $window_state -eq 1 ]; then
  
  if [ $current_workspace -eq 1 ]; then
    exit 1
  fi
  hyprctl dispatch movetoworkspace $((window_at_workspace-1))
  hyprctl dispatch focusmonitor 0
  hyprctl dispatch workspace $((current_workspace-2))
  hyprctl dispatch focusmonitor 1
  exit 0
fi

if [ $window_x_position -eq 14 ] && [ $window_width -eq 1892 ]; then
  
  if [ $current_workspace -eq 1 ]; then
    exit 1
  fi
  hyprctl dispatch movetoworkspace $((window_at_workspace-1))
  hyprctl dispatch focusmonitor 0
  hyprctl dispatch workspace $((current_workspace-2))
  hyprctl dispatch focusmonitor 1
  exit 0
fi


if [ $window_x_position -eq 14 ]; then
  
  if [ $current_workspace -eq 1 ]; then
    exit 1
  fi
  hyprctl dispatch movetoworkspace $((window_at_workspace-1))
  hyprctl dispatch focusmonitor 0
  hyprctl dispatch workspace $((current_workspace-2))
  hyprctl dispatch focusmonitor 1
  exit 0
fi

# Nếu không thoả điều kiện di chuyển, di chuyển cửa sổ sang phải
hyprctl dispatch movewindow l
