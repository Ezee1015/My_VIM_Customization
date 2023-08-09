local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Compila la lista de packer cuando se actualiza este archivo
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
	]])

return require("packer").startup(function()
  use 'wbthomason/packer.nvim'
	use 'tpope/vim-fugitive'                                    -- INTEGRACION CON GIT
	use 'tpope/vim-rhubarb'                                     -- REQUISITO DE fugitive PARA :Gbrowse
	use 'lewis6991/gitsigns.nvim'                               -- CONTROL DE CAMBIOS DE UN ARCHIVO
	use 'windwp/nvim-autopairs'                                 -- CERRADO AUTOMÁTICO DE PARÉNTESIS, LLAVES, COMILLAS, ETC.
	use 'lukas-reineke/indent-blankline.nvim'                   -- PONE CON ' | ' SEGÚN LOS TABS PARA INDICAR EL CONTENIDO DE UNA ESTRUCTURA
	use 'norcalli/nvim-colorizer.lua'                           -- COLORIZADO DE CODIGOS HEXADECIMALES y de etiquetas rgb()
	use 'sheerun/vim-polyglot'                                  -- HIGHLIGHTNING DE LENGUAJES
	use 'easymotion/vim-easymotion'                             -- MOVERSE MÁS RAPIDO POR VIM CON ',' + 'f'
	use 'vim-scripts/DrawIt'                                    -- DIBUJAR LINEAS
	use 'gyim/vim-boxdraw'                                      -- DIBUJAR CUADRADOS
	use 'preservim/tagbar'                                      -- ESQUEMA QUE MUESTRA EN UNA LISTA LOS TIPOS DE VARIABLES Y EL NOMBRE DE LAS VARIABLES DECLARADAS.
	use 'nvim-treesitter/nvim-treesitter'                       -- MEJORA EL DIBUJADO DE LA SINTAXIS
	use 'nvim-treesitter/nvim-treesitter-context'               -- MUESTRA EN LA PARTE SUPERIOR DENTRO DE LA CLASE, FUNCION, ETC EN LA QUE SE ENCUENTRA
	use 'nvim-telescope/telescope.nvim' 												-- EXTENSION DE FZF ESCRITO EN LUA
	use 'nvim-lua/plenary.nvim'																	-- DEPENDENCIA DE TELESCOPE
	use 'BurntSushi/ripgrep'																		-- DEPENDENCIA DE TELESCOPE
	use 'mhinz/vim-startify'			                              -- PANTALLA DE INICIO
	use 'kyazdani42/nvim-web-devicons'                          -- ICONOS PARA VIM-STARTIFY
	use 'kyazdani42/nvim-tree.lua' 															-- ARBOL DE ARCHIVOS ESCRITO EN LUA (SIMIL A NERDTREE)
	use 'akinsho/bufferline.nvim' 															-- PESTAÑAS PARA CADA BUFFER (PARTE SUPERIOR)
	use 'nvim-lualine/lualine.nvim'                            	-- BARRA INFERIOR DE ESTADO CON COLORES
	use 'kshenoy/vim-signature'                                 -- PONE A LA IZQUIERDA DE LOS NUMEROS DE LINEA LA MARCA(m[letra]) QUE FUE ASIGNADA A LA LINEA
	use ('folke/tokyonight.nvim', {branch= 'main'})             -- COLORSCHEME DE TOKIO NIGHT
	-- LSPs que uso: clangd, cpptools, jdtls, lua-language-server lua_ls , python-lsp-server pylsp
	use {
		'VonHeikemen/lsp-zero.nvim', 															-- INTREGRACION ENTRE NVIM LSP Y LOS SNNIPPETS
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'}, 															-- CONFIGURACIONES PARA EL LSP INTEGRADO DE NEOVIM
			{'williamboman/mason.nvim', 														-- PARA INSTALAR SERVIDORES DE LENGUAJES
					run = ":MasonUpdate"
			},
			{'williamboman/mason-lspconfig.nvim'}, 									-- PARA CONFIGURAR EL LSP (MEJOR INTEGRACIÓN CON LSP)
			-- Autocompletion
			{'hrsh7th/nvim-cmp'}, 																	-- SERVIDOR DE AUTOCOMPLETADO
			{'hrsh7th/cmp-buffer'}, 																-- AUTOCOMPLETADO DE ARCHIVOS
			{'hrsh7th/cmp-path'}, 																	-- AUTOCOMPLETADO DE RUTAS DEL SISTEMA
			{'saadparwaiz1/cmp_luasnip'}, 													-- INTEGRACION ENTRE EL SERVIDOR DE AUTOCOMPLETADO Y EL PLUGIN DE SNIPPETS
			{'hrsh7th/cmp-nvim-lsp'}, 															-- AUTOCOMPLETADO PARA EL LSP DE NVIM (?)
			{'hrsh7th/cmp-nvim-lua'}, 															-- AUTOCOMPLETADO PARA LA API DE NEOVIM
			{'ray-x/lsp_signature.nvim'},														-- MUESTRA LOS PARAMETROS MIENTRAS SE ESCRIBE UNA FUNCIÓN
			-- Snippets
			{'L3MON4D3/LuaSnip'}, 																	-- SNIPPETS PARA NEOVIM EN LUA
			{'rafamadriz/friendly-snippets'}, 											-- COLECCION DE SNIPPETS
		}
	}
	-- use 'dstein64/vim-startuptime'  													  -- MUESTRA DE FORMA GRAFICA EL TIEMPO DE ARRANQUE
	use 'mbbill/undotree'
	use 'AckslD/nvim-neoclip.lua' 															-- HISTORIAL DE COPIADO CON TELESCOPE
	use 'folke/zen-mode.nvim' 																	-- CENTRA EL CODIGO AL CENTRO
	use 'folke/twilight.nvim' 																	-- RESALTA LA PORCION DE CODIGO DEBAJO DEL CURSOR
	use 'numToStr/Comment.nvim'                                 -- PERMITE COMENTAR CON 'gcc'
	use 'mg979/vim-visual-multi'        												-- VIM MULTIPLE CURSORS
	use 'akinsho/toggleterm.nvim' 															-- TERMINAL DESPLEGABLE
	use 'christoomey/vim-tmux-navigator'  											-- INTEGRAR VIM CON TMUX
	use({
			"iamcco/markdown-preview.nvim", 												-- LIVE PREVIEW DE MARKDOWN PARA NEOVIM
			run = function() vim.fn["mkdp#util#install"]() end,
	})
	use {
			"nvim-telescope/telescope-file-browser.nvim", 						-- FILE EXPLORER EN TELESCOPE
			requires = { "nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim" }
	}
	use 'dhruvasagar/vim-table-mode' 															-- ASISTENTE PARA LAS TABLAS EN MARKDOWN
	use 'mzlogin/vim-markdown-toc' 																-- GENERA LOS INDICES EN MARKDOWN
	use 'stevearc/oil.nvim' 																			-- ABRE UN DIRECTIORIO COMO UN BUFFER

	-- Instalación de Plugins en el primer arranque
  if packer_bootstrap then
    require('packer').sync()
  end
end)
