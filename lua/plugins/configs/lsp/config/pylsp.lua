return {
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false }, -- disable pyflakes
        pycodestyle = { enabled = false }, -- disable pycodestyle
        flake8 = { enabled = false },  -- disable flake8
        yapf = { enabled = false },    -- disable yapf
        mcabe = { enabled = false },   -- disable mccabe
        pylsp_black = { enabled = false }, -- disable black
        pylsp_mypy = { enabled = false }, -- disable mypy
        pylsp_isort = { enabled = false }, -- disable isort
      },
    },
  },
}
