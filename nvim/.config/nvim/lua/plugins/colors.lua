return {
  {
    "craftzdog/solarized-osaka.nvim",
    name = "solarized-osaka",
    opts = {
      styles = {
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptBorder = {
          fg = c.bg_dark,
        }
        hl.TelescopePromptTitle = {
          fg = c.bg_dark,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsNormal = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.LineNr = { fg = "#33383D" }
        hl.CursorLineNr = { fg = "#9ea6ae" }
        hl.NoiceVirtualText = { fg = "#3399BE", bg = nil }
      end,
    },
  },
  {
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        require("rose-pine").setup {
          variant = "moon",
          styles = {
            bold = true,
            italic = true,
            transparency = true,
          },
          highlight_groups = {
            CursorLine = {
              bg = "none",
            },
            NotifyBackground = { bg = "#000000" },
            TreesitterContext = { bg = "none" }, -- Set color for treesitter context lines
            IblScope = { fg = "#8D8D8D" },
            WinBar = { bg = "none" },
            WinBarNC = { bg = "#000000" },
          },
        }
      end,
    },
  },
  {
    "vague2k/vague.nvim",
    config = function() require("vague").setup { transparent = true } end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup {
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        undercurls = true,
        theme = "dragon",
        transparent = true,
        overrides = function(colors)
          local theme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require "kanagawa.lib.color"
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = "none" },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "none" },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
            TelescopePreviewNormal = { bg = "none" },
            TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = "#363738" }, -- apply to popups as well
            PmenuSel = { fg = "NONE", bg = theme.ui.special },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            ScrollbarHandle = { bg = theme.diag.warning, fg = theme.diag.warning },
          }
        end,
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = false,
    },
  },
  {
    "catppuccin",
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
        integrations = {
          notify = true,
          telescope = true,
        },
      }
    end,
  },
}
