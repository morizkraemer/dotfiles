return {
  {
    "mg979/vim-visual-multi",
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>U", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "j-morano/buffer_manager.nvim",
  },
}
