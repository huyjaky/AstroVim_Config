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

# Hàm di chuyển được sửa lại
move() {
    # Đảm bảo thứ tự lệnh đúng: di chuyển window trước, rồi chuyển workspace
    hyprctl dispatch movetoworkspace "$((window_at_workspace-1))"
    hyprctl dispatch workspace "$((current_workspace-2))"
    hyprctl dispatch focusmonitor 1
    exit 0
}

# Tắt fullscreen nếu đang bật
[ "$window_state" -eq 1 ] && hyprctl dispatch fullscreenstate 0

# Logic di chuyển
if [ "$window_x_position" -eq 14 ] && [ "$current_workspace" -ne 1 ]; then
    # Kiểm tra các điều kiện để di chuyển
    if [ "$window_state" -eq 1 ] || [ "$window_width" -eq 1892 ] || true; then
        move
    fi
fi

# Default action
hyprctl dispatch movewindow l
exit 0
