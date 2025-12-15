return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#0f0f0f", -- Default background (very dark grey)
                base01 = "#1a1a1a", -- Lighter background (status bars)
                base02 = "#1f1f1f", -- Selection background
                base03 = "#3a3a3a", -- Comments, invisibles
                base04 = "#d0d0d0", -- Dark foreground
                base05 = "#e6e6e6", -- Default foreground
                base06 = "#f2f2f2", -- Light foreground
                base07 = "#ffffff", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#d14c4c", -- Soft red (errors)
                base09 = "#d18f52", -- Soft orange
                base0A = "#d1c24d", -- Muted yellow
                base0B = "#7fb77e", -- Muted green
                base0C = "#86c7c8", -- Muted cyan
                base0D = "#8a8faf", -- Muted blue
                base0E = "#b48ead", -- Muted purple
                base0F = "#c8c088", -- Muted brown/yellow
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
