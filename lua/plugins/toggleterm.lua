return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      {
        "<C-.>",
        "<cmd>2ToggleTerm direction=vertical<cr>",
        desc = "Toggle terminal split vertical",
        mode = { "n", "t" },
      },
      { "<esc><esc>", [[<C-\><C-n>]], mode = "t", desc = "Go to normal mode" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return math.floor(vim.o.lines * 0.4)
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
}
