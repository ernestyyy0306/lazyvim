-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local del = vim.keymap.del

-- Fix Spell checking
keymap("n", "z0", "1z=", {
  desc = "Fix world under cursor",
})

keymap("n", "<leader>cb", "<cmd>lua require('utils.cspell').add_word_to_c_spell_dictionary()<CR>", {
  noremap = true,
  silent = true,
  desc = "Add Word to Dictionary",
})

-- Buffer management
local function set_filetype(ft)
  if not ft or ft == "" then
    vim.notify("No filetype provided", vim.log.levels.WARN)
    return
  end
  vim.bo.filetype = ft
  vim.notify("filetype set to: " .. ft, vim.log.levels.INFO)
end

keymap("n", "<leader>bn", ":enew<CR>", { noremap = true, silent = true, desc = "Buffer: new (empty)" })
keymap("n", "<leader>bf", function()
  vim.ui.input({ prompt = "Set filetype (e.g. python, lua, go): " }, function(input)
    if not input or input == "" then
      return
    end
    set_filetype(input)
  end)
end, { desc = "Buffer: set filetype" })

-- Escape with <C-c>
keymap({ "i", "n", "v" }, "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Use <C-c> as <Esc>" })

-- UFO Folding
keymap("n", "zR", require("ufo").openAllFolds)
keymap("n", "zM", require("ufo").closeAllFolds)

-- Clear scrollback WITHOUT killing the shell process
keymap("t", "<C-k>", function()
  vim.api.nvim_chan_send(vim.b.terminal_job_id, "clear && printf '\\033[3J'")
  local old_scrollback = vim.opt_local.scrollback:get()
  vim.opt_local.scrollback = 1
  vim.defer_fn(function()
    vim.opt_local.scrollback = old_scrollback
  end, 10)
end, { desc = "Clear Terminal Memory (Keep Process)" })

del("n", "<leader>K")

-- Search and replace
vim.keymap.set("n", "<leader>sr", function()
  require("grug-far").open({
    prefills = {
      paths = vim.fn.expand("%:p"),
    },
  })
end, { desc = "Grug Search/Replace Current File" })

vim.keymap.set("n", "<leader>sR", function()
  require("grug-far").open()
end, { desc = "Grug Search/Replace" })
