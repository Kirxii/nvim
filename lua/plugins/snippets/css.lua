---@diagnostic disable: undefined-global

return {
  -- Variables
  s("var", {
    t("var(--"),
    i(1, "variable-name"),
    t(")"),
    i(0),
  }),
  s("set", {
    t("--"),
    i(1, "variable-name"),
    t(": "),
    i(2, "value"),
    t(";"),
    i(0),
  }),

  -- Functions
  s("com", {
    t("color-mix(in "),
    i(1, "color-interpolation-method"),
    t(", "),
    i(2, "first-color"),
    t(", "),
    i(3, "second-color"),
    t(")"),
    i(0),
  }),
}
