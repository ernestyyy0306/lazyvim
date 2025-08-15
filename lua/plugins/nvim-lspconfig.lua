return {
  "neovim/nvim-lspconfig",
  -- other settings removed for brevity
  opts = {
    ---@type lspconfig.options
    servers = {
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
          experimental = {
            -- allows to use flat config format
            useFlatConfig = false,
          },
        },
      },
      vtsls = {
        -- Disable automatic workspace TypeScript SDK usage
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = false,
            tsdk = vim.fn.expand("/Users/ernestyap/.nvm/versions/node/v22.14.0/lib"),
          },
        },
      },
    },
  },
}
