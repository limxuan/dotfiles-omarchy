return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  priority = 1000,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "AstroNvim/astroui", opts = { icons = { Harpoon = "󱡀" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local harpoon = require "harpoon"
        local maps = opts.mappings
        maps.n["<Leader>a"] = { function() harpoon:list():add() end, desc = "Add file to harpoon" }
        maps.n["<Leader>e"] =
          { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Open harpoon menu" }
        maps.n["<leader>1"] = { function() harpoon:list():select(1) end, desc = "Select first harpoon file" }
        maps.n["<leader>2"] = { function() harpoon:list():select(2) end, desc = "Select second harpoon file" }
        maps.n["<leader>3"] = { function() harpoon:list():select(3) end, desc = "Select third harpoon file" }
      end,
    },
  },
}
