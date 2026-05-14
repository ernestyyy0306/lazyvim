return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      disable_inline_completion = true,
      disable_keymaps = false,
    })
  end,
}
