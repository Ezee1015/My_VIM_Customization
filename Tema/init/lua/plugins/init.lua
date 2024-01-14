-- TagBar
vim.g.tagbar_autofocus = 1
-- vim-visual-multi
vim.g.VM_show_warnings = 0
vim.g.VM_leader = 'ç'

return {
	-- Saltar entre palabras
  {"phaazon/hop.nvim",
    config = true,
    keys = {
      {'<leader>f', '<cmd>HopChar2<CR>', desc="Buscar palabras por 2 caracteres" },
      {'<leader>F', '<cmd>HopWord<CR>' , desc="Buscar palabras"                  },
    }
  },

  -- Multiple cursors
  "mg979/vim-visual-multi",

  -- Colorizado de códigos hexadecimales y de etiquetas rgb()
  {"norcalli/nvim-colorizer.lua",
    config = {
      '*' -- Execute for all filetypes. See docs --> :h colorizer.lua
    },
    lazy = false
  },

  -- Indentation
  {"lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      exclude = {
        filetypes = {
          'help',
          'startify',
        }
      }
    },
    lazy=false
  },

	-- Terminal
	{"akinsho/toggleterm.nvim",
    opts = {
      size = vim.o.columns * 0.45
    },
    keys = {
      {'<leader>x', ':ToggleTerm direction=float<CR>'    , { silent= true, noremap= true, desc="Terminal flotante" } },
      {'<leader>X', ':ToggleTerm direction=vertical<CR>' , { silent= true, noremap= true, desc="Terminal vertical" } },
    }
  },

	-- Lista de variables y funciones globales
	{"preservim/tagbar",
    keys = {
      { '<F8>', ':TagbarToggle<CR>', { silent= true, desc="TagBar"} }
    }
  },

	-- Highlightning de lenguajes
	-- "sheerun/vim-polyglot",

	-- Indica a la izquierda de la ventana los marks
	"kshenoy/vim-signature",

	-- Historial, estilo Git, de cambios
	{"mbbill/undotree",
    keys = {
      { '<F5>', ':UndotreeToggle<CR>', { noremap= true } }
    },

    cmd="UndotreeToggle"
  },

	-- Integrar con tmux
	"christoomey/vim-tmux-navigator",

  {"kristijanhusak/vim-carbon-now-sh",
    cmd = "CarbonNowSh",
    keys = {
      { "<F10>", ":CarbonNowSh<CR>", mode="v"},
      { "<F10>", "mfggVG:CarbonNowSh<CR>`fdmf", mode="n"}
    },
  }
}

------------------------------
-- IMÁGENES DE SOURCE CODE
-- Muy buenos los plugins, pero no funciona en las últimas versiones de Neovim (el de LUA),
-- y no puedo proporcionarle mi colorscheme de Neovim (ambos).
-- Además requiere/depende de rust
------------------------------
--
-- Vimscript
-- {"segeljakt/vim-silicon",
--   config = function ()
--     vim.g.silicon = {
--       theme = "gruvbox-dark",
--       font = "Hack"
--     }
--   end,
--   cmd="Silicon",
--   keys = {
--     { "<F9>", ":Silicon output.png<CR>", mode="v"},
--     { "<F9>", ":Silicon output.png<CR>", mode="n"}
--   }
-- },
--
-- En LUA (MEJOR)
--
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
