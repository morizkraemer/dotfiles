return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.routes, {
                filter = {
                    event = "notify",
                    find = "No information available",
                },
                opts = { skip = true },
            })
            opts.presets.lsp_doc_border = true
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "rcarriga/nvim-notify",
    },
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                separator_style = "thick",
            },
        },
    },
    -- {
    --   "lukas-reineke/indent-blankline.nvim",
    --   opts = {
    --     scope = {
    --       enabled = true,
    --     },
    --   },
    -- },
}
