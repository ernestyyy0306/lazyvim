local function run_linter_by(name)
  require("lint").try_lint(name)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd(string.format("augroup au_%s_lint_%d", name, bufnr))
  vim.cmd("au!")
  vim.cmd(string.format("au BufWritePost <buffer=%d> lua require'lint'.try_lint('%s')", bufnr, name))
  vim.cmd(string.format("au BufEnter <buffer=%d> lua require'lint'.try_lint('%s')", bufnr, name))
  vim.cmd("augroup end")
end

return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ["*"] = { "cspell", "codespell" },
      },
    },
    keys = {
      {
        "<leader>rl",
        function()
          local items = {
            "actionlint",
            "dotenv_linter",
            "write_good",
          }

          vim.ui.select(items, {
            prompt = "Select Linter to run",
          }, function(choice)
            if choice ~= nil then
              run_linter_by(choice)
            end
          end)
        end,
        desc = "Run Nvim Lint",
      },
      {
        "<leader>fv",
        function()
          local file = vim.fn.fnameescape(vim.fn.expand("%:p"))

          if not string.match(file, "%.env") then
            vim.notify("This is not a .env file", vim.log.levels.WARN)
            return
          end

          vim.cmd("silent !dotenv-linter fix " .. file)
        end,
        desc = "dotenv linter - fix",
      },
    },
  },
}
