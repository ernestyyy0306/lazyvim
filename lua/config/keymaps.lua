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

keymap("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Use <C-c> as <Esc>" })
keymap("n", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Use <C-c> as <Esc>" })
