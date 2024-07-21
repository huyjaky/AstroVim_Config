return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    ensure_installed = { "python" },
    handlers = {
      python = function(source_name)
        local dap = require "dap"
        dap.adapters.python = {
          type = "executable",
          command = "/home/duckq/.conda/envs/pytorch/bin/python3.12",
          args = {
            "-m",
            "debugpy.adapter",
          },
        }

        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}", -- This configuration will launch the current file if used.
          },
        }
      end,
    },
  },
}
