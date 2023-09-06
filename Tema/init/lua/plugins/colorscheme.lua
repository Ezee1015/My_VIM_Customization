return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function ()
    vim.cmd[[colorscheme tokyonight]]
    vim.o.background = 'dark'
    -- vim.g.tokyonight_style = "storm"
    -- vim.g.tokyonight_style = "night"
  end
}
