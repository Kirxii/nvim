---@diagnostic disable: undefined-global, unused-local

local M = {}

local function in_math()
  return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local tabIns = table.insert
local tabExt = vim.tbl_deep_extend
local lstExt = vim.list_extend

---@param name string
---@param description string
---@param command string
---@param extra? table
local function snip(name, description, command, extra)
  local specs = {
    command = command,
    context = {
      name = name,
      description = description,
    },
  }
  if extra then
    tabIns(specs, extra)
  end

  return specs
end

local greek_specs = {
  -- Typing specs
  [";a"] = snip("α", "Lowercase alpha", "\\alpha"),
  [";b"] = snip("β", "Lowercase beta", "\\beta"),
  [";g"] = snip("γ", "Lowercase gamma", "\\gamma"),
  [";G"] = snip("Γ", "Uppercase gamma", "\\Gamma"),
  [";d"] = snip("δ", "Lowercase delta", "\\delta"),
  [";D"] = snip("Δ", "Uppercase delta", "\\Delta"),
  [";e"] = snip("ε", "Lowercase epsilon", "\\epsilon"),
  [":e"] = snip("ε", "Variant epsilon", "\\varepsilon"),
  [";z"] = snip("ζ", "Lowercase zeta", "\\zeta"),
  [";h"] = snip("η", "Lowercase eta", "\\eta"),
  [";th"] = snip("θ", "Lowercase theta", "\\theta"),
  [":th"] = snip("ϑ", "Variant theta", "\\vartheta"),
  [";Th"] = snip("Θ", "Uppercase theta", "\\Theta"),
  [";i"] = snip("ι", "Lowercase iota", "\\iota"),
  [";k"] = snip("κ", "Lowercase kappa", "\\kappa"),
  [";l"] = snip("λ", "Lowercase lambda", "\\lambda"),
  [";L"] = snip("Λ", "Uppercase lambda", "\\Lambda"),
  [";m"] = snip("μ", "Lowercase mu", "\\mu"),
  [";n"] = snip("ν", "Lowercase nu", "\\nu"),
  [";x"] = snip("ξ", "Lowercase xi", "\\xi"),
  [";X"] = snip("Ξ", "Uppercase xi", "\\Xi"),
  [";pi"] = snip("π", "Lowercase pi", "\\pi"),
  [";Pi"] = snip("Π", "Uppercase pi", "\\Pi"),
  [";r"] = snip("ρ", "Lowercase rho", "\\rho"),
  [":r"] = snip("ϱ", "Variant rho", "\\varrho"),
  [";s"] = snip("σ", "Lowercase sigma", "\\sigma"),
  [";S"] = snip("Σ", "Uppercase sigma", "\\Sigma"),
  [";ta"] = snip("τ", "Lowercase tau", "\\tau"),
  [";u"] = snip("υ", "Lowercase upsilon", "\\upsilon"),
  [";U"] = snip("ϒ", "Uppercase upsilon", "\\Upsilon"),
  [";ph"] = snip("ϕ", "Lowercase phi", "\\phi"),
  [":ph"] = snip("φ", "Variant phi", "\\varphi"),
  [";Ph"] = snip("Φ", "Uppercase phi", "\\Phi"),
  [";c"] = snip("χ", "Lowercase chi", "\\chi"),
  [";ps"] = snip("ψ", "Lowercase psi", "\\psi"),
  [";Ps"] = snip("Ψ", "Uppercase psi", "\\Psi"),
  [";om"] = snip("ω", "Lowercase omega", "\\omega"),
  [";Om"] = snip("Ω", "Uppercase omega", "\\Omega"),

  -- Deleting specs
  -- Fool-proof specs
}

local greek_snips = {}
for k, v in pairs(greek_specs) do
  tabIns(
    greek_snips,
    s(tabExt("keep", { trig = k, snippetType = "autosnippet" }, v.context), t(v.command), { condition = in_math() })
  )
end
lstExt(M, greek_snips)

return M
