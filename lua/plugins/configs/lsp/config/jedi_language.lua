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
    signatureHelp = {
      enable = false,
    },
    workspace = {
      -- environmentPath = "/home/duckq1u/miniconda3/envs/OCR3/bin/python",
      environmentPath = vim.fn.exepath "python",
      ignore = {
        -- "/home/duckq1u/miniconda3/envs/OCR3/lib/python3.11/site-packages/transformers/model/albert/configuration_albert.py",
        -- "/home/duckq1u/miniconda3/envs/ocr2/lib/python3.12/site-packages/transformers/models/albert/configuration_albert.py",
        "**configuration_albert.py",
        "**/unsloth_compiled_cache/**",
      },
    },

    jediSettings = {
      autoImportModules = {
        "numpy",
        "pandas",
        "torch",
        "torchvision",
        "pytorch_lightning"
        -- "torchmetrics",
      },
    },
  },
}
