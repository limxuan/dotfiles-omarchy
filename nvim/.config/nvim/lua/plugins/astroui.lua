-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
local pmenu_bg = vim.api.nvim_get_hl(0, { name = "Pmenu" }).bg

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "vague",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights n all themes
        WinBar = { bg = "none" },
        WinBarNC = { bg = "none" },
        NotifyBackground = { bg = "#000000" },
      },
      ["vague"] = {
        NoicePopup = { bg = pmenu_bg },
        NoiceHover = { bg = pmenu_bg },
      },
      ["kanagawa"] = {
        Pmenu = { bg = "#363738" },
        NoicePopup = { bg = "#363738" },
        NoiceHover = { bg = "#363738" },
      },
      ["solarized-osaka"] = {
        HeirlineGitBranch = { bg = "none" }, -- Transparent for Git branch in statusline
        HeirlineFileInfo = { bg = "none" },
        NotifyBackground = { bg = "none" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
    status = {
      colors = {
        git_branch_bg = "none",
        file_info_bg = "none",
        winbar_bg = "none",
        winbarnc_bg = "none",
        diagnostics_bg = "none",
        lsp_bg = "none",
      },
    },
  },
}
