local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- INTEGRACION CON GIT
	"tpope/vim-fugitive",

	-- REQUISITO DE fugitive PARA :Gbrowse
	"tpope/vim-rhubarb",

	-- CONTROL DE CAMBIOS DE UN ARCHIVO
	"lewis6991/gitsigns.nvim",

	-- CERRADO AUTOMÁTICO DE PARÉNTESIS, LLAVES, COMILLAS, ETC.
	"windwp/nvim-autopairs",

	-- PONE CON ' | ' SEGÚN LOS TABS PARA INDICAR EL CONTENIDO DE UNA ESTRUCTURA
	"lukas-reineke/indent-blankline.nvim",

	-- COLORIZADO DE CODIGOS HEXADECIMALES y de etiquetas rgb()
	"norcalli/nvim-colorizer.lua",


	-- HIGHLIGHTNING DE LENGUAJES
	"sheerun/vim-polyglot",

	-- MOVERSE MÁS RAPIDO POR NEOVIM CON ',' + 'f'
	"phaazon/hop.nvim",

	-- DIBUJAR LINEAS
	"jbyuki/venn.nvim",

	-- ESQUEMA QUE MUESTRA EN UNA LISTA LOS TIPOS DE VARIABLES Y EL NOMBRE DE LAS VARIABLES DECLARADAS.
	"preservim/tagbar",

	-- MEJORA EL DIBUJADO DE LA SINTAXIS
	"nvim-treesitter/nvim-treesitter",

	-- MUESTRA EN LA PARTE SUPERIOR DENTRO DE LA CLASE, FUNCION, ETC EN LA QUE SE ENCUENTRA
	-- "nvim-treesitter/nvim-treesitter-context",

	-- EXTENSION DE FZF ESCRITO EN LUA
	"nvim-telescope/telescope.nvim",

	-- DEPENDENCIA DE TELESCOPE
	"nvim-lua/plenary.nvim",

	-- DEPENDENCIA DE TELESCOPE
	"BurntSushi/ripgrep",

	-- PANTALLA DE INICIO
	"mhinz/vim-startify",

	-- ICONOS PARA VIM-STARTIFY
	"kyazdani42/nvim-web-devicons",

	-- ARBOL DE ARCHIVOS ESCRITO EN LUA (SIMIL A NERDTREE)
	"kyazdani42/nvim-tree.lua",

	-- PESTAÑAS PARA CADA BUFFER (PARTE SUPERIOR)
	"akinsho/bufferline.nvim",

	-- BARRA INFERIOR DE ESTADO CON COLORES
	"nvim-lualine/lualine.nvim",

	-- PONE A LA IZQUIERDA DE LOS NUMEROS DE LINEA LA MARCA(m[letra]) QUE FUE ASIGNADA A LA LINEA
	"kshenoy/vim-signature",

	-- COLORSCHEME DE TOKIO NIGHT
	"folke/tokyonight.nvim",

	-- CONFIGURACIONES PARA EL LSP INTEGRADO DE NEOVIM
	{"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP Support
			-- INTREGRACION ENTRE NVIM LSP Y LOS SNNIPPETS
			"VonHeikemen/lsp-zero.nvim",
			-- PARA INSTALAR SERVIDORES DE LENGUAJES
			"williamboman/mason.nvim",
			-- PARA CONFIGURAR EL LSP (MEJOR INTEGRACIÓN CON LSP)
			"williamboman/mason-lspconfig.nvim",
			-- PARA INSTALAR AUTOMATICAMENTE LSPs Y DAPs
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- Autocompletion
			-- SERVIDOR DE AUTOCOMPLETADO
			"hrsh7th/nvim-cmp",
			-- AUTOCOMPLETADO DE ARCHIVOS
			"hrsh7th/cmp-buffer",
			-- AUTOCOMPLETADO DE RUTAS DEL SISTEMA
			"hrsh7th/cmp-path",
			-- INTEGRACION ENTRE EL SERVIDOR DE AUTOCOMPLETADO Y EL PLUGIN DE SNIPPETS
			"saadparwaiz1/cmp_luasnip",
			-- AUTOCOMPLETADO PARA EL LSP DE NVIM (?)
			"hrsh7th/cmp-nvim-lsp",
			-- AUTOCOMPLETADO PARA LA API DE NEOVIM
			"hrsh7th/cmp-nvim-lua",
			-- MUESTRA LOS PARAMETROS MIENTRAS SE ESCRIBE UNA FUNCIÓN
			"ray-x/lsp_signature.nvim",
			-- Snippets
			-- SNIPPETS PARA NEOVIM EN LUA
			"L3MON4D3/LuaSnip",
			-- COLECCION DE SNIPPETS
			"rafamadriz/friendly-snippets",
		}
	},

	-- Historial, estilo Git, de cambios
	"mbbill/undotree",

	-- HISTORIAL DE COPIADO CON TELESCOPE
	"AckslD/nvim-neoclip.lua",
	-- CENTRA EL CODIGO AL CENTRO
	"folke/zen-mode.nvim",
	-- RESALTA LA PORCION DE CODIGO DEBAJO DEL CURSOR
	"folke/twilight.nvim",
	-- PERMITE COMENTAR CON 'gcc'
	"numToStr/Comment.nvim",
	-- VIM MULTIPLE CURSORS
	"mg979/vim-visual-multi",
	-- TERMINAL DESPLEGABLE
	"akinsho/toggleterm.nvim",
	-- INTEGRAR VIM CON TMUX
	"christoomey/vim-tmux-navigator",

	-- LIVE PREVIEW DE MARKDOWN PARA NEOVIM
	{"iamcco/markdown-preview.nvim",
		build = function ()
			vim.fn["mkdp#util#install"]()
		end,
	},


	-- FILE EXPLORER EN TELESCOPE
	{"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim"
		}
	},

	-- ASISTENTE PARA LAS TABLAS EN MARKDOWN
	"dhruvasagar/vim-table-mode",

	-- GENERA LOS INDICES EN MARKDOWN
	"mzlogin/vim-markdown-toc",

	-- ABRE UN DIRECTIORIO COMO UN BUFFER
	"stevearc/oil.nvim",

	-- Interfaz del DAP
	{"rcarriga/nvim-dap-ui",
		dependencies={
			-- DAP para vim: cliente para Nvim del debugger
			"mfussenegger/nvim-dap",
			-- Muestra junto a la declaración el valor de la variable
			"theHamsta/nvim-dap-virtual-text",
			-- Configuración para el DAP de Python
			"mfussenegger/nvim-dap-python",
			-- Utiliza Telescope para DAP
			"nvim-telescope/telescope-dap.nvim"
		}
	}
}

require("lazy").setup(plugins)
