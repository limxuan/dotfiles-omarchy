return {
  {
    "noice.nvim",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = false,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          view = "notify",
          filter = {
            event = "msg_showmode",
          },
        },
      },
    },
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.window = {
        completion = {
          border = nil,
        },
        documentation = require("cmp").config.window.bordered {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      }
      opts.formatting.fields = { "abbr", "kind" }
      opts.mapping = {
        ["<Tab>"] = function(fallback) fallback() end,
        ["<S-Tab>"] = function(fallback) fallback() end,
        ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm { select = false }, { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      enabled = false,
      indent = {
        char = "│",
      },
    },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>ui"] = { "<cmd>IBLToggle<cr>", desc = "Toggle indent blankline" },
          },
        },
      },
    },
  },
  {
    "neo-tree.nvim",
    lazy = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>O"] = { "<CMD>Neotree toggle float<CR>", desc = "Open AstroNvim" }
        end,
      },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "single",
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      window = {
        position = "float",
        width = 35,
      },
      source_selector = {
        sources = {
          { source = "filesystem", display_name = "   Files " },
        },
      },
    },
  },
}
