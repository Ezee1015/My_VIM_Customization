return {

	-- Highlightning de lenguajes
	-- "sheerun/vim-polyglot",

	-- Indica a la izquierda de la ventana los marks
	"kshenoy/vim-signature",

	-- Historial, estilo Git, de cambios
	"mbbill/undotree",

	-- Integrar con tmux
	"christoomey/vim-tmux-navigator",

	-- Live preview de markdown
	{"iamcco/markdown-preview.nvim",
		build = function ()
			vim.fn["mkdp#util#install"]()
		end,
		dependencies = {
			"dhruvasagar/vim-table-mode",
			"mzlogin/vim-markdown-toc",
		}
	},
}
