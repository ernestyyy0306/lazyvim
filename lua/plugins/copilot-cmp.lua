return {
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
