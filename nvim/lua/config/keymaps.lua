-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.set({ "n", "v" }, "B", "^")
vim.keymap.set({ "n", "v" }, "E", "$")

vim.keymap.set("n", "gq", function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col(".")
    local closest_quote = nil
    local min_distance = #line

    for _, quote in ipairs({ "'", '"' }) do
        local quote_col = line:find(quote, col, true)
        if quote_col and quote_col - col < min_distance then
            closest_quote = quote
            min_distance = quote_col - col
        end
    end

    if closest_quote then
        vim.api.nvim_feedkeys("f" .. closest_quote .. "i", "n", true)
    end
end)

vim.keymap.set("n", "gQ", function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col(".")
    local closest_quote = nil
    local min_distance = #line

    for _, quote in ipairs({ "'", '"' }) do
        for i = col - 2, 1, -1 do
            if line:sub(i, i) == quote and col - i < min_distance then
                closest_quote = quote
                min_distance = col - i
                break
            end
        end
    end

    if closest_quote then
        vim.api.nvim_feedkeys("F" .. closest_quote .. "i", "n", true)
    end
end)

vim.keymap.set("n", "oi", "o")
vim.keymap.set("n", "Oi", "O")
vim.keymap.set("n", "oo", "o<Esc>")
vim.keymap.set("n", "OO", "O<Esc>")
vim.keymap.set("n", "vv", "ggVG")

-- buffer explorer
vim.keymap.set(
    "n",
    "<leader><leader>",
    ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>',
    { noremap = true, silent = true }
)
