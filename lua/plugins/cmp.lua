return {
  {
    "onsails/lspkind.nvim",
    opts = {
      symbol_map = require "plugins.configs.ui.lspkind",
    },
  },
  { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
  { "github/copilot.vim", event = "BufRead" },
  { "hrsh7th/cmp-buffer", event = "BufRead" },
  { "hrsh7th/cmp-path", event = "BufRead" },
  {
    "hrsh7th/nvim-cmp",
    event = "VimEnter",
    depedencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      local function has_words_before()
        local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "cmdline", priority = 800 },
        { name = "path", priority = 250 },
      }

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline {
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm { select = true }
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
            else
              fallback()
            end
          end, { "i", "c" }),
        },
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              -- code for me options for processing command when press enter

              ignore_cmds = {
                "q",
                "qa",
                "qall",
                "quitall",
                "quit",
                "wall",
                "wq",
              },
            },
          },
        }),
      })

      return require("astrocore").extend_tbl(opts, {
        -- Configure window style
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
            -- border = "none",
            side_padding = 0,
          },
        },
        formatting = {
          -- Show icon at the beginning and menu at the end
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimetry = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = " [" .. (strings[2] or "") .. "]"
            return kind
          end,
        },
        -- Always select the first option
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        -- Custom mapping
        mapping = {
          -- Esc to close completion menu
          ["<Esc>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },


          -- Tab to select completion
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() and has_words_before() then
              fallback()
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Use <C-n> and <C-p> to select luasnip
          ["<C-n>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- NOTE: disable tabl when using copilot PART2
          vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("\\<CR>")', { expr = true, silent = true }),
          -- ["<C-f>"] = cmp.mapping(function(fallback)
          --   -- Check if Copilot is suggesting something
          --   if vim.fn["copilot#Accept"]() ~= "" then
          --   else
          --     fallback() -- If no suggestion, fallback to default behavior
          --   end
          -- end, { "i", "s" }), -- Enable in insert and command-line mode
        },
        experimental = {
          ghost_text = false, -- this feature conflict with copilot.vim's preview.

        },
      })
    end,
  },
}
