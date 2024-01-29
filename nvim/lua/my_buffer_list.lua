local nui = require("nui.menu")
local event = require("nui.utils.autocmd").event

-- Function to get a list of open buffers
local function get_buffers()
  local buffers = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      table.insert(buffers, {
        id = bufnr,
        name = vim.fn.fnamemodify(bufname, ":t"), -- Just the filename
      })
    end
  end
  return buffers
end

-- Function to open the NUI window with buffer list
local function open_buffer_list()
  print("hi")
  local buffers = get_buffers()

  local menu_items = {}
  for _, buffer in ipairs(buffers) do
    table.insert(menu_items, nui.menu.item(buffer.name, buffer.id))
  end

  local menu = nui.menu({
    position = "50%",
    size = {
      width = 50,
      height = math.min(#menu_items + 2, 20),
    },
    border = {
      style = "rounded",
      text = {
        top = " Open Buffers ",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal,FloatBorder:TelescopeBorder",
    },
  }, {
    lines = menu_items,
    max_width = 30,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = function(item)
      vim.api.nvim_set_current_buf(item.id)
    end,
  })

  menu:mount()

  -- Close the menu when leaving the buffer
  menu:on(event.BufLeave, menu.menu_props.close, { once = true })
end

-- Expose the function to Neovim
return {
  open_buffer_list = open_buffer_list,
}
