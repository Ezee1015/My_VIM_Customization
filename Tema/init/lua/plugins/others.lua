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
  {"mg979/vim-visual-multi",
    config = function ()
      vim.g.VM_show_warnings = 0
      vim.g.VM_leader = 'ç'
    end,
    lazy = false
  },

  -- Colorizado de códigos hexadecimales y de etiquetas rgb()
  {"norcalli/nvim-colorizer.lua",
    config = true,
    lazy = false
  },

  -- Indentation
  {"lukas-reineke/indent-blankline.nvim",
    config = {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    },
    lazy=false
  },

	-- Terminal
	{"akinsho/toggleterm.nvim",
    config = {
      size = vim.o.columns * 0.45
    },
    keys = {
      {'<leader>x', ':ToggleTerm direction=float<CR>'    , { silent= true, noremap= true, desc="Terminal flotante" } },
      {'<leader>X', ':ToggleTerm direction=vertical<CR>' , { silent= true, noremap= true, desc="Terminal vertical" } },
    }
  },

	-- Lista de variables y funciones globales
	{"preservim/tagbar",
    config = function()
      vim.g.tagbar_autofocus = 1
    end,
    keys = {
      { '<F8>', ':TagbarToggle<CR>', { silent= true, desc="TagBar"} }
    }
  },
}
