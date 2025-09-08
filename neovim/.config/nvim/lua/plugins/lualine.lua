return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      -- this is all you need
      theme = "sourcery",

      -- everything below
      -- is extra style
      -- can't help myself :P
      component_separators = { left = "░", right = "░" },
      section_separators = { left = "▓▒░", right = "░▒▓" },
    },
    sections = {
      lualine_b = {
        "branch", {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " " },
          diagnostics_color = {
            error = { fg = "#151515" },
            warn =  { fg = "#151515" },
            info =  { fg = "#151515" },
          },
        },
      },
      lualine_x = {
        { "encoding", padding = { left = 1, right = 1 }, separator = { left = "░▒▓" } },
        { "fileformat" },
        { "filetype" },
      },
      lualine_y = { "searchcount", "progress" },
    },
  },
}
