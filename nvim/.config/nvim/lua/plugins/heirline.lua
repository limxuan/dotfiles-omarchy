return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.winbar = {
      init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      fallthrough = false,
      {
        condition = function() return not status.condition.is_active() end,
        status.component.breadcrumbs {
          icon = { hl = true },
          hl = status.hl.get_attributes("winbarnc", true),
          prefix = false,
          padding = { left = 0 },
        },
      },
      {
        status.component.breadcrumbs {
          icon = { hl = true },
          hl = status.hl.get_attributes("winbar", true),
          prefix = false,
          padding = { left = 0 },
        },
      },
    }

    opts.statusline = {
      -- statusline
      hl = { fg = "#ffffff", bg = "none" },
      status.component.mode(),
      status.component.git_branch(),
      -- harpoon_components.index, // moved to harpoon2, need to revisit
      status.component.file_info {
        -- Set relative path name
        filename = { modify = ":~:." },
        filetype = false,
        -- Only show filename when its file, not neotree, telescope, etc
        condition = function()
          return not status.condition.buffer_matches {
            buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
            filetype = { "aerial", "dapui_.", "neo%-tree", "NvimTree" },
          }
        end,
      },
      status.component.diagnostics(),
      status.component.fill(),
      status.component.lsp { padding = { right = 1 } },
    }

    return opts
  end,
}
