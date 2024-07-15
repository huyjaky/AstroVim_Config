return {
  "CRAG666/code_runner.nvim",
  opts = {
    filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },
      python = "python3 -u",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt",
      },
    },
  },
  keys = {

    { "<leader>r", ":RunCode<CR>", mode = "n", noremap = true, silent = false, desc = "Run code" },
    { "<leader>rf", ":RunFile<CR>", mode = "n", noremap = true, silent = false, desc = "Run file" },
    { "<leader>rft", ":RunFile tab<CR>", mode = "n", noremap = true, silent = false, desc = "Run file in new tab" },
    { "<leader>rp", ":RunProject<CR>", mode = "n", noremap = true, silent = false, desc = "Run project" },
    { "<leader>rc", ":RunClose<CR>", mode = "n", noremap = true, silent = false, desc = "Close run" },
    { "<leader>crf", ":CRFiletype<CR>", mode = "n", noremap = true, silent = false, desc = "Change run filetype" },
    { "<leader>crp", ":CRProjects<CR>", mode = "n", noremap = true, silent = false, desc = "Change run projects" },
  },
}
