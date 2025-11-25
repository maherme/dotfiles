return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- para que cargue antes que otras cosas
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- opciones: latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
        },
        integrations = {
          alpha = true,
          treesitter = true,
          neotree = true,
          telescope = true,
          gitsigns = true,
          indent_blankline  = {
            enabled = true,
            scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

