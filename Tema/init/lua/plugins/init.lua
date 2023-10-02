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
    config = true,
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
}
