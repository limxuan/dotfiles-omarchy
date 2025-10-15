return {
  "markdown-preview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "AstroNvim/astroui", opts = { icons = { Harpoon = "󱡀" } } },
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            codeium_no_map_tab = true,
          },
        },
        mappings = {
          n = {
            ["<Leader>um"] = {
              "<Cmd>MarkdownPreviewToggle<CR>",
              noremap = true,
              desc = "Toggle Codeium active",
            },
          },
        },
        opts = function(_, opts)
          -- use min browser
          -- opts.options.g.mkdp_browser = "/Applications/Min.app"
        end,
      },
    },
  },
}
