return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "cpp", "lua", "bash", "python" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
