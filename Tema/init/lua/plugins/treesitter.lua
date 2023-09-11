return {

	{"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cpp", "lua", "java", "python", "bash", "html", "css", "javascript", "sql" },
      auto_install = true,
      highlight = {
        enable = true,
      },
    }
  },

	-- Muestra en la parte superior dentro de la clase, función, etc en la que se encuentra
	"nvim-treesitter/nvim-treesitter-context",
}
