return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = {
    "BufReadPre",
    "BufNewFile",
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
    "windwp/nvim-ts-autotag",
  },

  config = function()
    require("nvim-treesitter.configs").setup {
      modules = {},
      ignore_install = {},
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "cpp",
        "markdown",
        "markdown_inline",
        "regex",
        "bash",
        "go",
        "python",
        "java",
        "http",
        "json",
        "gleam",
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
      },

      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = true,
        },
      },
    }

    require("treesitter-context").setup {
      enable = false,
      max_lines = 5,
      min_window_height = 20,
      line_numbers = true,
    }

    vim.treesitter.language.register("javascript", "datacorejs")
    vim.treesitter.language.register("javascript", "datacorejsx")
    vim.treesitter.language.register("ts", "datacorets")
    vim.treesitter.language.register("tsx", "datacoretsx")
  end,
}
