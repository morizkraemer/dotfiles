return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
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
