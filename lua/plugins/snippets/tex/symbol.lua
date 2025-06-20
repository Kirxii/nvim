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
  [";al"] = snip("α", "Lowercase alpha", "\\alpha"),
  [";be"] = snip("β", "Lowercase beta", "\\beta"),
  [";ga"] = snip("γ", "Lowercase gamma", "\\gamma"),
  [";Ga"] = snip("Γ", "Uppercase gamma", "\\Gamma"),
  [";de"] = snip("δ", "Lowercase delta", "\\delta"),
  [";De"] = snip("Δ", "Uppercase delta", "\\Delta"),
  [";ep"] = snip("ε", "Lowercase epsilon", "\\epsilon"),
  [";EP"] = snip("ε", "Variant epsilon", "\\varepsilon"),
  [";ze"] = snip("ζ", "Lowercase zeta", "\\zeta"),
  [";et"] = snip("η", "Lowercase eta", "\\eta"),
  [";th"] = snip("θ", "Lowercase theta", "\\theta"),
  [";Th"] = snip("Θ", "Uppercase theta", "\\Theta"),
  [";TH"] = snip("ϑ", "Variant theta", "\\vartheta"),
  [";io"] = snip("ι", "Lowercase iota", "\\iota"),
  [";ka"] = snip("κ", "Lowercase kappa", "\\kappa"),
  [";la"] = snip("λ", "Lowercase lambda", "\\lambda"),
  [";La"] = snip("Λ", "Uppercase lambda", "\\Lambda"),
  [";mu"] = snip("μ", "Lowercase mu", "\\mu"),
  [";nu"] = snip("ν", "Lowercase nu", "\\nu"),
  [";xi"] = snip("ξ", "Lowercase xi", "\\xi"),
  [";Xi"] = snip("Ξ", "Uppercase xi", "\\Xi"),
  [";pi"] = snip("π", "Lowercase pi", "\\pi"),
  [";Pi"] = snip("Π", "Uppercase pi", "\\Pi"),
  [";rh"] = snip("ρ", "Lowercase rho", "\\rho"),
  [";RH"] = snip("ϱ", "Variant rho", "\\varrho"),
  [";si"] = snip("σ", "Lowercase sigma", "\\sigma"),
  [";Si"] = snip("Σ", "Uppercase sigma", "\\Sigma"),
  [";ta"] = snip("τ", "Lowercase tau", "\\tau"),
  [";up"] = snip("υ", "Lowercase upsilon", "\\upsilon"),
  [";Up"] = snip("ϒ", "Uppercase upsilon", "\\Upsilon"),
  [";ph"] = snip("ϕ", "Lowercase phi", "\\phi"),
  [";Ph"] = snip("Φ", "Uppercase phi", "\\Phi"),
  [";PH"] = snip("φ", "Variant phi", "\\varphi"),
  [";ch"] = snip("χ", "Lowercase chi", "\\chi"),
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
