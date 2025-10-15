return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = { enabled = true },
    notifier = { enabled = true },
    lazygit = { enabled = true },
    git = { enabled = true },
  },
  keys = {
    { "<leader>ud", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>fw", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit with Snacks" },
    { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Get root with Snacks" },
  },
}
