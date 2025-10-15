-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.media.vim-wakatime" },
  {
    import = "astrocommunity.completion.codeium-vim",
  },
  {
    import = "astrocommunity.markdown-and-latex.markdown-preview-nvim",
  },
  {
    import = "astrocommunity.motion.flash-nvim",
  },
  {
    import = "astrocommunity.motion.mini-ai",
  },
  {
    import = "astrocommunity.colorscheme.catppuccin",
  },
  {
    import = "astrocommunity.scrolling.nvim-scrollbar",
  },
}
