return {
  "Exafunction/codeium.vim",
  cmd = {
    "Codeium",
    "CodeiumEnable",
    "CodeiumDisable",
    "CodeiumToggle",
    "CodeiumAuto",
    "CodeiumManual",
  },
  event = "BufEnter",
  enabled = true,
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          codeium_no_map_tab = true,
        },
      },
      mappings = {
        n = {
          ["<Leader>uc"] = {
            "<Cmd>CodeiumChat<CR>",
            noremap = true,
            desc = "Toggle Codeium active",
          },
          ["<Leader>uC"] = {
            "<Cmd>CodeiumToggle<CR>",
            noremap = true,
            desc = "Toggle Codeium active",
          },
        },
        i = {
          ["<C-a>"] = {
            function() return vim.fn["codeium#Accept"]() end,
            expr = true,
          },
          ["<C-x>"] = {
            function() return vim.fn["codeium#Clear"]() end,
            expr = true,
          },
        },
      },
    },
  },
}
