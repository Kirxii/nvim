return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",

  opts = {
    filetypes = {
      "*",
      "!markdown",
      "!neo-tree",
      "!neo-tree-popup",
      "!TelescopePrompt",
      "!lazy",
      "!mason",
      "!noice", -- Command Line
      "!popup",
      "!prompt",
    },

    user_default_options = {
      names = true,
      names_opts = {
        lowercase = false,
        camelcase = false,
        uppercase = true,
        strip_digits = false,
      },

      RGB = true, -- #RGB hex codes
      RGBA = true,
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = true, -- 0xAARRGGBB hex codes

      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      tailwind = false, -- Enable tailwind colors
      sass = { enable = false, parsers = { "css" } }, -- Enable sass colors

      mode = "virtualtext", -- Set the display mode.
      virtualtext = "󱓻",
      virtualtext_inline = "before",

      always_update = true,
    },
  },
}
