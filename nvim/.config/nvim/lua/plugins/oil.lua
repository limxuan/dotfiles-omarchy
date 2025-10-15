return {
  {
    "oil.nvim",
    lazy = false,
    opts = {},
    config = function()
      require("oil").setup {
        keymaps = {
          ["<C-y>"] = { "actions.select", opts = { vertical = true } },
        },
      }
    end,
  },
}
