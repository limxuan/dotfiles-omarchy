return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>fs"] = {
          function()
            if require("astrocore").is_available "aerial.nvim" then
              require("telescope").extensions.aerial.aerial()
            else
              require("telescope.builtin").lsp_document_symbols()
            end
          end,
          desc = "Find symbols",
        }
        maps.n["<Leader>gc"] = {
          require("telescope.builtin").git_branches,
          desc = "Checkout branch",
        }
      end,
    },
    {
      "andrew-george/telescope-themes",
    },
  },
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon
    opts.defaults.prompt_prefix = get_icon("Search", 1)
    opts.defaults.selection_caret = get_icon("GitRenamed", 1)
    return opts
  end,
}
