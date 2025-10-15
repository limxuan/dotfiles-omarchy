-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      update_in_insert = false,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        conceallevel = 0,
        showtabline = 0,
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        scrolloff = 10,
        sidescrolloff = 10,
      },
      g = { -- vim.g.<key>
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["<Esc>"] = {
          function()
            vim.cmd.noh()
            vim.api.nvim_buf_clear_namespace(0, 24, 0, -1)
          end,
        },
        ["<Leader>o"] = { "<CMD>Oil<CR>", desc = "Toggle oil.nvim" },
        ["<Leader>uD"] = { function() require("astrocore.toggles").diagnostics() end, desc = "Toggle diagnostics" },

        ["<leader>va"] = { "gg<S-v>G", desc = "Select all" },
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },
        ["J"] = { "mzJ`z" },
        ["Q"] = { "@qj" },
        ["n"] = { "nzzzv" },
        ["N"] = { "Nzzzv" },
        ["gl"] = { "$" },
        ["ygl"] = { "y$" },
        ["<Leader>ft"] = { "<Cmd>TodoTelescope<CR>", desc = "Find TODOs" },
        ["<Leader>fT"] = {
          "<Cmd>Telescope themes<CR>",
          desc = "Find themes",
        },
        ["<Leader>f/"] = {
          function()
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
              winblend = 10,
              previewer = false,
            })
          end,
          desc = "Find words in current buffer",
        },

        ["="] = { "<C-a>", desc = "Increment" },
        ["-"] = { "<C-x>", desc = "Decrement" },

        -- navigate buffer tabs
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },

        -- navigate quickfix
        ["]q"] = { vim.cmd.cnext, desc = "Next quickfix" },
        ["[q"] = { vim.cmd.cprev, desc = "Previous quickfix" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader>ls"] = { function() require("aerial").toggle() end, desc = "Symbols outline" },

        -- toggles
        ["<Leader>ui"] = { "<cmd>IBLToggle<cr>", desc = "Toggle indent blankline" },

        ["H"] = { "2<C-w>>" },
        ["L"] = { "2<C-w><" },

        -- disabled
        ["<Leader>fo"] = false,
      },
      x = {
        ["Q"] = { "<cmd>norm @q<cr>" },
      },
      i = {},
      v = {
        ["Q"] = { "<cmd>norm @q<cr>" },
        ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move selected line below" },
        ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move selected line above" },
        ["gl"] = { "$" },
      },
    },
    autocmds = {
      toggle_virtual_text = {
        {
          event = "InsertEnter",
          desc = "Disable virtual text diagnostics on insert mode",
          group = "toggle_virtual_text",
          callback = function() vim.diagnostic.config { virtual_text = false } end,
        },
        {
          event = "InsertLeave",
          desc = "Enable virtual text diagnostics on normal mode",
          group = "toggle_virtual_text",
          callback = function() vim.diagnostic.config { virtual_text = true } end,
        },
      },
    },
  },
}
