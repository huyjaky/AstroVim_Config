return {
  {
    {
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
      opts = {
        eval = true,
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t",
        },

        layouts = {
          {
            elements = {
              {
                id = "repl",
                size = 0.5,
              },
              {
                id = "console",
                size = 0.5,
              },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              {
                id = "scopes",
                size = 0.25,
              },
              {
                id = "breakpoints",
                size = 0.25,
              },
              -- {
              --   id = "stacks",
              --   size = 0.25,
              -- },
            },
            position = "bottom",
            size = 8,
          },
        },
      },
      config = function(_, opts)
        local dap = require "dap"
        local dapui = require "dapui"

        -- Initialize dap-ui
        dapui.setup(opts)

        -- Prevent UI from closing when debugging session ends
        dap.listeners.after.event_terminated["dapui"] = function()
          -- Do nothing, keeping the UI open
        end
        dap.listeners.after.event_exited["dapui"] = function()
          -- Do nothing, keeping the UI open
        end

        -- Optionally, open dap-ui when session starts
        dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      event = "User AstroFile",
      opts = {
        commented = false,
        enabled = true,
        enabled_commands = true,
        show_stop_reason = true,
        virt_text_pos = "eol",
      },
    },
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {
      icons = {
        type = "󰜁 ",
        parameter = "󰏪 ",
        offspec = " ", -- hint kind not defined in official LSP spec
        unknown = " ", -- hint kind is nil
      },
      label = {
        truncateAtChars = 20,
        padding = 1,
        marginLeft = 0,
        sameKindSeparator = ", ",
      },
      extmark = {
        priority = 50,
      },
      autoEnableHints = true,
    },
  },
}
