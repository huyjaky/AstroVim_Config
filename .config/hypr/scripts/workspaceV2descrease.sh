#!/bin/bash

# Tắt globbing để tăng tốc
set -f

# Lấy current_workspace trực tiếp từ JSON
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

# Tính toán second_workspace dựa trên chẵn/lẻ
second_workspace=$((current_workspace % 2 == 0 ? current_workspace - 1 : current_workspace + 1))

# Tính toán workspace cho các monitor
primary_monitor_workspace=$((current_workspace - 2))
secondary_monitor_workspace=$((second_workspace - 2))

# Kiểm tra giới hạn workspace
[ "$primary_monitor_workspace" -le 0 ] || [ "$secondary_monitor_workspace" -ge 9 ] && exit 1

# Thực thi chuyển đổi workspace với tối ưu animation
hyprctl dispatch workspace "$primary_monitor_workspace"
hyprctl dispatch workspace "$secondary_monitor_workspace"

exit 0
