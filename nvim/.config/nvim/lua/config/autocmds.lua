-- Aplica fundo transparente
local function apply_transparent_bg()
  local highlights = {
    Normal = { bg = "NONE" },
    NormalNC = { bg = "NONE" },
    SignColumn = { bg = "NONE" },
    NormalFloat = { bg = "NONE" },
    FloatBorder = { bg = "NONE" },
    VertSplit = { bg = "NONE" },
    NeoTreeNormal = { bg = "NONE" },
    NeoTreeNormalNC = { bg = "NONE" },
  }

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_transparent_bg,
})

apply_transparent_bg()
