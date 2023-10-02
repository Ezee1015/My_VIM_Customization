return {
  {"kristijanhusak/vim-carbon-now-sh",
    cmd = "CarbonNowSh",
    keys = {
      { "<S-<F9>>", ":CarbonNowSh<CR>", mode="v"}
    },
  },

  {"segeljakt/vim-silicon",
    config = function ()
      vim.g.silicon = {
        theme = "gruvbox-dark",
        font = "Hack"
      }
    end,
    cmd="Silicon",
    keys = {
      { "<F9>", ":Silicon output.png<CR>", mode="v"}
    }
  }

}

------------------------------
-- Muy bueno, pero no funciona en las últimas versiones de Neovim.
-- Además requiere/depende de rust
------------------------------
-- return {
--   {"krivahtoo/silicon.nvim",
--     -- branch = "nvim-0.9", -- Eliminar el branch, una vez que se solucione el error que actualmente hay con main (que solo funciona con nightly) y nvim 0.9
--     build = "./install.sh",
--     opts = {
--       font = "Hack=21",
--       theme = "tokyonight-storm",
--       watermark = {
--         text = ' @ezee1015',
--       },
--       window_title = function()
--         return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
--       end,
--     },
--     cmd = "Silicon",
--     keys = {
--       { '<leader>img', ':Silicon output.png', { noremap= true, mode="v" } }
--     }
--   }
-- }
