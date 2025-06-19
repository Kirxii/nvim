return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = true,
  event = "BufEnter *.md",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local keyset = vim.keymap.set
  end,
  opts = {
    heading = {
      icons = {
        " 󰎤 ",
        " 󰎧 ",
        " 󰎪 ",
        " 󰎭 ",
        " 󰎱 ",
        " 󰎳 ",
      },
    },

    bullet = {
      icons = {
        "●",
        "◉",
        "○",
        "◆",
        "◈",
        "◇",
      },
    },

    link = {
      wiki = {
        icon = " ",
      },
    },

    latex = {
      enabled = false,
    },

    quote = { repeat_linebreak = true },
    win_options = {
      showbreak = { default = vim.api.nvim_get_option_value("showbreak", {}), rendered = "  " },
      breakindent = { default = vim.api.nvim_get_option_value("breakindent", {}), rendered = true },
      breakindentopt = { default = vim.api.nvim_get_option_value("breakindentopt", {}), rendered = "" },
    },
  },
}
