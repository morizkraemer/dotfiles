return {
  {
    "j-morano/buffer_manager.nvim",
    lazy = false,
    keys = {},
    opts = {
      select_menu_item_commands = {
        v = {
          key = "<C-v>",
          command = "vsplit",
        },
        h = {
          key = "<C-h>",
          command = "split",
        },
      },
      focus_alternate_buffer = true,
      short_file_names = true,
      short_term_names = true,
    },
  },
}
