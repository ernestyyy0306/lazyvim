local M = {}

function M.feedkeys(keys, mode)
  if mode == nil then
    mode = "n"
  end
  local key = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(key, mode, false)
end

return M
