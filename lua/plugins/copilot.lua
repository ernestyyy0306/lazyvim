return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<Tab>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    -- Tab behavior: fallback when no Copilot suggestion
    vim.keymap.set("i", "<Tab>", function()
      local copilot = require("copilot.suggestion")
      if copilot.is_visible() then
        copilot.accept()
      end
    end, { desc = "Copilot Accept or Tab", silent = true })
  end,
}
