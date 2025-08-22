# Plugins Organization

Thư mục `plugins` đã được tổ chức lại theo chức năng để dễ quản lý và bảo trì hơn.

## Cấu trúc thư mục

### Core Files
- **`astrocore.lua`** - Cấu hình cốt lõi của AstroNvim (mappings, options, autocmds)
- **`astrolsp.lua`** - Cấu hình Language Server Protocol
- **`astroui.lua`** - Cấu hình giao diện người dùng
- **`mason.lua`** - Quản lý LSP servers, formatters, debuggers
- **`treesitter.lua`** - Cấu hình syntax highlighting
- **`whichkey.lua`** - Cấu hình key mappings

### Functional Categories

#### 🎨 **`themes.lua`** - Themes và Colorschemes
- Bamboo (main theme)
- Catppuccin (disabled)
- Các themes khác (disabled)

#### 🔧 **`completion.lua`** - Completion và AI Assistance
- GitHub Copilot
- Blink.cmp (replacement cho nvim-cmp)
- LSP Kind icons
- Các completion plugins bị disable

#### ✏️ **`editor.lua`** - Editor Enhancements
- Comment management
- Auto-save functionality
- Indent scope highlighting
- Code folding (nvim-ufo)
- Split navigation (smart-splits)
- Terminal support (disabled)

#### 🚀 **`motion.lua`** - Motion, Navigation và Multiple Cursors
- Multiple cursors support
- Brackets split/join
- Better word motion (spider)
- Flash navigation
- Code block movement

#### 🖥️ **`ui.lua`** - UI và Interface Enhancements
- Dashboard (alpha-nvim)
- Status line (heirline)
- Notifications
- Todo comments highlighting
- Smart bracket pairing
- Treesitter context
- Virtual text context
- Noice UI

#### 🛠️ **`development.lua`** - Development Tools và Debugging
- LSP End hints
- DAP UI (disabled)
- DAP Virtual Text (disabled)
- Các development plugins bị disable

#### 📝 **`formatting.lua`** - Formatting và Linting
- None-ls formatting
- Ruff formatting
- Các formatting plugins bị disable

#### 📁 **`file_explorer.lua`** - File Explorer và File Management
- Neo-tree file explorer
- Các file explorer plugins bị disable

#### 📋 **`snippets.lua`** - Snippets
- LuaSnip
- Các snippet plugins bị disable

#### ❌ **`disabled.lua`** - Disabled Plugins
- Tất cả các plugins bị disable, được tổ chức theo category

## Lợi ích của cấu trúc mới

1. **Dễ tìm kiếm**: Mỗi file có một chức năng cụ thể
2. **Dễ bảo trì**: Khi cần thay đổi một tính năng, chỉ cần sửa một file
3. **Dễ mở rộng**: Thêm plugins mới vào đúng category
4. **Rõ ràng**: Tên file cho biết ngay chức năng
5. **Tổ chức**: Các plugins liên quan được nhóm lại với nhau

## Cách thêm plugins mới

1. Xác định chức năng của plugin
2. Thêm vào file tương ứng
3. Nếu không có category phù hợp, tạo file mới
4. Cập nhật README này nếu cần

## Ghi chú

- Các plugins bị disable được giữ lại trong `disabled.lua` để dễ tham khảo
- Một số plugins có thể xuất hiện ở nhiều nơi (ví dụ: trong specs của plugin khác)
- Cấu trúc này tương thích với AstroNvim và Lazy.nvim
