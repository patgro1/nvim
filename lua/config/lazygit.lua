local M = {}

local function open_floating_window(cmd)
  local buf = vim.api.nvim_create_buf(false, true)

  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen(cmd, {
    on_exit = function()
      vim.api.nvim_win_close(win, true)
    end,
  })

  vim.keymap.set("t", "q", "<cmd>close<cr>", { buffer = true, noremap = true })
  vim.cmd("startinsert")
end

-- Open lazygit in floating window
function M.open_lazygit()
  local exists = vim.fn.executable("lazygit")
  if exists == 0 then
    vim.notify("lazygit not found in PATH", vim.log.levels.ERROR)
    return
  end
  open_floating_window("lazygit")
end

-- Open git log for current file in floating window
function M.open_lazygit_file_log()
  local exists = vim.fn.executable("lazygit")
  if exists == 0 then
    vim.notify("lazygit not found in PATH", vim.log.levels.ERROR)
    return
  end

  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("No file open", vim.log.levels.WARN)
    return
  end

  local cmd = "lazygit -f " .. vim.fn.shellescape(file)
  open_floating_window(cmd)
end

return M
