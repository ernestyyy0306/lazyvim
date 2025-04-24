return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<Tab>", -- 👈 Accept with Tab
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    vim.keymap.set("i", "<Tab>", function()
      local copilot = require("copilot.suggestion")
      if copilot.is_visible() then
        copilot.accept()
      end
    end, { desc = "Copilot Accept or Tab", silent = true })
  end,
}
