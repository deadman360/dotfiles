return {
  -- Configuração do plugin Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "hard", -- Variante hard (fundo mais escuro)
        palette_overrides = {},
        overrides = {
          -- Fundo ultra-dark (quase preto) para todas as áreas
          Normal = { bg = "#080808" },
          NormalFloat = { bg = "#0a0a0a" },
          NormalNC = { bg = "#080808" },
          SignColumn = { bg = "#080808" },
          StatusLine = { bg = "#111111" },
          StatusLineNC = { bg = "#0a0a0a" },
          CursorLine = { bg = "#111111" },
          CursorLineNr = { bg = "#111111" },
          LineNr = { bg = "#080808" },
          FoldColumn = { bg = "#080808" },
          VertSplit = { bg = "#080808" },
          WinSeparator = { bg = "#080808" },
        },
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },

  -- Configura o LazyVim para usar o Gruvbox como padrão
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
