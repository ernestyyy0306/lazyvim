return {
  "nvim-neo-tree/neo-tree.nvim",
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local is_git_commit = vim.fn.argv(0):match("COMMIT_EDITMSG")

        if not is_git_commit then
          vim.schedule(function()
            vim.cmd("Neotree show")
          end)
        end
      end,
    })
  end,
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
}
