return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
      persist_buffer_sort = false,
      sort_by = function(buffer_a, buffer_b)
        local modified_a = vim.fn.getftime(buffer_a.path)
        local modified_b = vim.fn.getftime(buffer_b.path)
        return modified_a < modified_b
      end,
    },
  },
}
