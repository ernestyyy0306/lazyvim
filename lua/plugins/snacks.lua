return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
       ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗           
       ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║           
       ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║           
       ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║           
       ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
       ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝   EY      
]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 2 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 1 } },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = { 2, 1 } },
        { section = "startup" },
      },
    },
    picker = {
      exclude = { -- add folder names here to exclude
        ".git",
        "node_modules",
        "package-lock.json",
      },
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = {
            "**/.git/*",
          },
        },
      },
    },
  },
}
