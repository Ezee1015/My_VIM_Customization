return {

	-- Highlightning de lenguajes
	-- "sheerun/vim-polyglot",

	-- Indica a la izquierda de la ventana los marks
	"kshenoy/vim-signature",

	-- Historial, estilo Git, de cambios
	{"mbbill/undotree",
    keys = {
      { '<F5>', ':UndotreeToggle<CR>', { noremap= true } }
    }
  },

	-- Integrar con tmux
	"christoomey/vim-tmux-navigator",

	-- Live preview de markdown
	{"iamcco/markdown-preview.nvim",
		build = function ()
			vim.fn["mkdp#util#install"]()
		end,

    -- No se puede hacer `cmd = "MarkdownPreview"` porque una vez cargado
    -- el plugin al llamar a MarkdownPreview, no reconoce el comando hasta
    -- salir y volver a entrar al documento, ya que seguramente habilita
    -- al comando con un `autocmd` que lo carga al entrar en un documento
    -- de Markdown
	},

  "dhruvasagar/vim-table-mode",

  {"mzlogin/vim-markdown-toc",
    keys = {
      { '<leader>toc', 'gg:GenTocGFM<CR>', { noremap= true } }
    }
  }
}
