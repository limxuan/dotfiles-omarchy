return {
  "folke/todo-comments.nvim",
  opts = {},
  event = "User AstroFile",
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["[t"] = { function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
          ["]t"] = {
            function() require("todo-comments").jump_next() end,
            desc = "Next todo comment",
          },
        },
      },
    },
  },
}
