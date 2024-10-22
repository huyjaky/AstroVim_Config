
#!/bin/bash

# Lấy thông tin của cửa sổ hiện tại chỉ một lần
window_info=$(hyprctl activewindow)
window_state=$(echo "$window_info" | grep 'fullscreen:' | awk '{print $2}')

# NOTE: Di chuyển cửa sổ nếu vị trí X vượt qua ngưỡng
if [ $window_state -eq 1 ]; then
  hyprctl dispatch focusmonitor 0
  exit 0
fi

hyprctl dispatch movefocus l
