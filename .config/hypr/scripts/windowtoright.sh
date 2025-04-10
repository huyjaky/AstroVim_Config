#!/bin/bash

# Tắt globbing để tăng tốc
set -f

# Lấy thông tin cửa sổ và workspace bằng JSON
window_info=$(hyprctl activewindow -j)
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

# Trích xuất thông tin cần thiết
window_x_position=$(echo "$window_info" | jq -r '.at[0]')
window_state=$(echo "$window_info" | jq -r '.fullscreen')
window_width=$(echo "$window_info" | jq -r '.size[0]')
window_at_workspace=$(echo "$window_info" | jq -r '.workspace.id')

# Tắt fullscreen nếu cần trước khi di chuyển
[ "$window_state" -eq 1 ] && hyprctl dispatch fullscreenstate 0

# Hàm di chuyển được tối ưu
move() {
    hyprctl dispatch movetoworkspace "$((window_at_workspace+1))"
    hyprctl dispatch workspace "$((current_workspace+2))"
    hyprctl dispatch focusmonitor 0
    exit 0
}

# Logic di chuyển được đơn giản hóa
if [ "$current_workspace" -ne 8 ]; then
    if [ "$window_x_position" -eq 1934 ] && { [ "$window_state" -eq 1 ] || [ "$window_width" -eq 1892 ]; }; then
        move
    elif [ "$window_x_position" -eq 2990 ]; then
        move
    fi
fi

# Default action
hyprctl dispatch movewindow r
exit 0
