---@diagnostic disable: unused-local, param-type-mismatch

return {
  "L3MON4D3/LuaSnip",
  version = "v2.3.0",

  dependencies = {
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require("luasnip.util.events")
    local ai = require("luasnip.nodes.absolute_indexer")
    local extras = require("luasnip.extras")
    local l = extras.lambda
    local rep = extras.rep
    local p = extras.partial
    local m = extras.match
    local n = extras.nonempty
    local dl = extras.dynamic_lambda
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local conds = require("luasnip.extras.expand_conditions")
    local postfix = require("luasnip.extras.postfix").postfix
    local types = require("luasnip.util.types")
    local parse = require("luasnip.util.parser").parse_snippet
    local ms = ls.multi_snippet
    local k = require("luasnip.nodes.key_indexer").new_key
    local load_snippet = require("luasnip.loaders.from_lua").load
    local keyset = vim.keymap.set

    keyset({ "i" }, "<C-k>", function()
      ls.expand()
    end, { silent = true })
    keyset({ "i", "s" }, "<C-l>", function()
      ls.jump(1)
    end, { silent = true })
    keyset({ "i", "s" }, "<C-j>", function()
      ls.jump(-1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    ls.config.set_config {
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    }

    load_snippet { paths = { "~/Appdata/Local/nvim/lua/plugins/snippets" } }

    ls.add_snippets("all", {
      s("-2", {
        t("–"),
      }),
      s("-3", {
        t("—"),
      }),
    })

    ls.filetype_extend("markdown", { "tex" })
  end,
}
