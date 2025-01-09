local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}
-- Function to create a floating window
local function open_floating_window(opts)
    -- Create a new buffer
    opts = opts or {}
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    -- Define the size and position of the floating window
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)
    local win_opts = {
        relative = "editor", -- Position relative to the editor
        width = width,
        height = height,
        col = (vim.o.columns - width) / 2, -- Center horizontally
        row = (vim.o.lines - height) / 2, -- Center vertically
        style = "minimal", -- Minimal UI
        border = "rounded", -- Rounded border
    }

    -- Open the floating window
    local win = vim.api.nvim_open_win(buf, true, win_opts)

    return { buf = buf, win = win }
end

-- Escape terminal mode with double escape
vim.keymap.set("t", "<esc><esc>", "<C-\\><c-n>")
vim.api.nvim_create_user_command("FloatTerminal", function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = open_floating_window({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd("startinsert")
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end, {})
require("which-key").add({
    mode = { "n", "t" },
    "<leader>tt",
    "<cmd>FloatTerminal<cr>",
    desc = "Toggle floating terminal in working dir",
})
