local M = {}

function M.focus_snacks_dashboard()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })

    if ft == "snacks_dashboard" then
      vim.api.nvim_set_current_win(win)
      return true
    end
  end
  return false
end

return M
