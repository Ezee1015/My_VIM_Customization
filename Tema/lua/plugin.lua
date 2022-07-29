vim.g.package_home = vim.fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "start/packer.nvim"

local packer_repo = string.format("")
local install_cmd = string.format("term git clone --depth=1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim")

-- Auto-install packer in case it hasn't been installed.
if not isdir(packer_install_dir) then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
  vim.api.nvim_echo({ { "Restart nvim and execute :PackerInstall", "Type" } }, true, {})
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
-- Compila la lista de packer cuando se actualiza este archivo
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
	]])

return require("packer").startup(function()
  use 'wbthomason/packer.nvim'
	use 'tpope/vim-commentary'                                  -- PERMITE COMENTAR CON 'gcc'
	use 'tpope/vim-fugitive'                                    -- INTEGRACION CON GIT
	use 'tpope/vim-rhubarb'                                     -- REQUISITO DE fugitive PARA :Gbrowse
	use 'airblade/vim-gitgutter'                                -- CONTROL DE CAMBIOS DE UN ARCHIVO
	use 'Raimondi/delimitMate'                                  -- CERRADO AUTOMÁTICO DE PARÉNTESIS, LLAVES, COMILLAS, ETC.
	use 'dense-analysis/ale'                                    -- MARCA ERRORES DE SYNTAX CON '>>' EN ROJO CON UNA BREVE EXPLICACIÓN.
	use 'Yggdroot/indentLine'                                   -- PONE CON ' | ' SEGÚN LOS TABS PARA INDICAR EL CONTENIDO DE UNA ESTRUCTURA
	use 'norcalli/nvim-colorizer.lua'                           -- COLORIZADO DE CODIGOS HEXADECIMALES y de etiquetas rgb() y rgba()
	use 'sheerun/vim-polyglot'                                  -- HIGHLIGHTNING DE LENGUAJES
	use 'easymotion/vim-easymotion'                             -- MOVERSE MÁS RAPIDO POR VIM CON ',' + 'f'
	use('neoclide/coc.nvim', {branch= 'release'})               -- SERVIDOR DE AUTOCOMPLETADO. Ver: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
	use 'vim-scripts/DrawIt'                                    -- DIBUJAR LINEAS
	use 'gyim/vim-boxdraw'                                      -- DIBUJAR CUADRADOS
	use 'preservim/tagbar'                                      -- ESQUEMA QUE MUESTRA EN UNA LISTA LOS TIPOS DE VARIABLES Y EL NOMBRE DE LAS VARIABLES DECLARADAS.
	if(vim.fn.has('python3')) then
	    use 'SirVer/ultisnips'                                  -- APP DE SNIPPETS
	    use 'honza/vim-snippets'                                -- SNIPPETS DE LENGUAJES
	end
	use 'nvim-treesitter/nvim-treesitter'                       -- MEJORA EL DIBUJADO DE LA SINTAXIS
	use 'nvim-treesitter/nvim-treesitter-context'               -- MUESTRA EN LA PARTE SUPERIOR DENTRO DE LA CLASE, FUNCION, ETC EN LA QUE SE ENCUENTRA
	use 'nvim-telescope/telescope.nvim' 												-- EXTENSION DE FZF ESCRITO EN LUA
	use 'nvim-lua/plenary.nvim'																	-- DEPENDENCIA DE TELESCOPE
	use 'BurntSushi/ripgrep'																		-- DEPENDENCIA DE TELESCOPE
	use 'mhinz/vim-startify'			                              -- PANTALLA DE INICIO
	use 'kyazdani42/nvim-web-devicons'                          -- ICONOS PARA VIM-STARTIFY
	use 'kyazdani42/nvim-tree.lua' 															-- ARBOL DE ARCHIVOS ESCRITO EN LUA (SIMIL A NERDTREE)
	use 'akinsho/bufferline.nvim'
	use 'nvim-lualine/lualine.nvim'                            	-- BARRA INFERIOR DE ESTADO CON COLORES
	use 'kshenoy/vim-signature'                                 -- PONE A LA IZQUIERDA DE LOS NUMEROS DE LINEA LA MARCA(m[letra]) QUE FUE ASIGNADA A LA LINEA
	use ('folke/tokyonight.nvim', {branch= 'main'})             -- COLORSCHEME DE TOKIO NIGHT
	use 'terryma/vim-multiple-cursors' 													-- VIM MULTIPLE CURSORS
	use('vim-scripts/c.vim', {['for']= {'c', 'cpp'}})           -- ESPECIALIZACION EN LENGUAJE C
end)
