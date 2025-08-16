return {

  init_options = {
    completion = {
      disableSnippets = true,
    },
    diagnostics = {
      enable = false,
    },
    hover = {
      enable = true,
    },
    workspace = {
      -- environmentPath = "/home/duckq1u/miniconda3/envs/OCR3/bin/python",
      environmentPath = vim.fn.exepath("python"),
      ignore = {
        "/home/duckq1u/miniconda3/envs/OCR3/lib/python3.11/site-packages/transformers/mode ls/albert/configuration_albert.py",
      },
    },

    jediSettings = {
      autoImportModules = {
        "numpy",
        "pandas",
        "torch",
        -- "torchmetrics",
        -- "pytorch_lightning",
      },
    },
  },
}
