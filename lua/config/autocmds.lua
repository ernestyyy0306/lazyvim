-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local buffer_triggered = false

local function is_snack_explorer_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })

    if ft == "snacks_picker_list" then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd({ "SessionLoadPost", "BufReadPost" }, {
  callback = function()
    if buffer_triggered or is_snack_explorer_open() then
      return
    end

    require("snacks").explorer()
    buffer_triggered = true
  end,
})
