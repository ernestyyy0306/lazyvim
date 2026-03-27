-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
local Explorer = require("utils.explorer")

local buffer_triggered = false

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    local win_id = vim.api.nvim_get_current_win()

    if buffer_triggered or Explorer.is_explorer_open() then
      return
    end

    require("snacks").explorer()

    buffer_triggered = true

    vim.defer_fn(function()
      if vim.api.nvim_win_is_valid(win_id) then
        vim.api.nvim_set_current_win(win_id)
      end
    end, 450)
  end,
})
