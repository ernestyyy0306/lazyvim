-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local buffer_triggered = false

local function get_neotree_wins()
  local wins = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
    if ft == "neo-tree" then
      table.insert(wins, win)
    end
  end
  return wins
end

local function is_neotree_open()
  return #get_neotree_wins() > 0
end

vim.api.nvim_create_autocmd({ "SessionLoadPost", "BufReadPost" }, {
  callback = function()
    if buffer_triggered or is_neotree_open() then
      return
    end
    vim.cmd("Neotree")
    buffer_triggered = true
  end,
})
