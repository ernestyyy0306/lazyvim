-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set

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
