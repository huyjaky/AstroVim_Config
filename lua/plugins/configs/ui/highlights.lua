return {
  init = function() -- this table overrides highlights in all themes
    local get_hlgroup = require("astroui").get_hlgroup
    local ui = require("astroui")
    local utils = require("astrocore")

    local hl = {
      -- remove background of virtual texts
      DiagnosticVirtualTextError = { fg = get_hlgroup("DiagnosticError").fg, bg = "none" },
      DiagnosticVirtualTextHint = { fg = get_hlgroup("DiagnosticHint").fg, bg = "none" },
      DiagnosticVirtualTextInfo = { fg = get_hlgroup("DiagnosticInfo").fg, bg = "none" },
      DiagnosticVirtualTextWarn = { fg = get_hlgroup("DiagnosticWarn").fg, bg = "none" },

      CursorLineNr = { fg = "#FFD700", bg = "none", bold = true },
      CursorLine = { fg = "none", bg = "#005C4C", bold = true },
      CursorColumn = { fg = "none", bg = "#005C4C", bold = true },

      Visual = { fg = "#000000", bg = "#FFFFFF", bold = true },

      -- remove background of inlay hints
      LspInlayHint = { fg = "#FF748B", bg = "none" },

      -- Highlight cho variable matching
      LspReferenceText = { fg = "#FFFFFF", bg = "#FF6B35", bold = true }, -- Cam đậm + chữ trắng
      LspReferenceRead = { fg = "#000000", bg = "#00E5FF", bold = true }, -- Xanh cyan + chữ đen
      LspReferenceWrite = { fg = "#FFFFFF", bg = "#E91E63", bold = true }, -- Hồng đậm + chữ trắng
    }

    return hl
  end,
  astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
    -- Normal = { bg = "#000000" },
  },
}
