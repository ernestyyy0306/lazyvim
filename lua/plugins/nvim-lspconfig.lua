return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      },
      eslint = {
        settings = {
          workingDirectories = { mode = "auto" },
          useFlatConfig = false,
        },
      },
      vtsls = {
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = false,
            tsdk = vim.fn.expand("~/.nvm/versions/node/v22.14.0/lib"),
          },
        },
      },
    },
  },
}
