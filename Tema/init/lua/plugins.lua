local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

--*****************************************************************************
-- Plug install packages
--*****************************************************************************
Plug 'scrooloose/nerdtree'                                  -- COMPLEMENTO DE ARBOL DE ARCHIVOS
Plug 'Xuyuanp/nerdtree-git-plugin'                          -- ASTERISCOS EN NERDTREE CON GIT
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'              -- ICONOS DE LOS ARCHIVOS
Plug 'tpope/vim-commentary'                                 -- PERMITE COMENTAR CON 'gcc'
Plug 'tpope/vim-fugitive'                                   -- INTEGRACION CON GIT
-- Plug 'vim-airline/vim-airline'                              -- BARRA INFERIOR DE ESTADO CON COLORES
-- Plug 'Ezee1015/vim-airline-themes'                          -- TEMAS PARA LABARRA INFERIOR DE ESTADO CON COLORES
Plug 'nvim-lualine/lualine.nvim'                            -- BARRA INFERIOR DE ESTADO CON COLORES
Plug 'airblade/vim-gitgutter'                               -- CONTROL DE CAMBIOS DE UN ARCHIVO
Plug 'vim-scripts/CSApprox'                                 -- FUNCION :colorscheme
Plug 'Raimondi/delimitMate'                                 -- CERRADO AUTOMÁTICO DE PARÉNTESIS, LLAVES, COMILLAS, ETC.
Plug 'dense-analysis/ale'                                   -- MARCA ERRORES DE SYNTAX CON '>>' EN ROJO CON UNA BREVE EXPLICACIÓN.
Plug 'Yggdroot/indentLine'                                  -- PONE CON ' | ' SEGÚN LOS TABS PARA INDICAR EL CONTENIDO DE UNA ESTRUCTURA
Plug 'tpope/vim-rhubarb'                                    -- REQUISITO DE fugitive PARA :Gbrowse
Plug 'norcalli/nvim-colorizer.lua'                          -- COLORIZADO DE CODIGOS HEXADECIMALES y de etiquetas rgb() y rgba()

Plug 'sheerun/vim-polyglot'                                 -- HIGHLIGHTNING DE LENGUAJES
Plug 'easymotion/vim-easymotion'                            -- MOVERSE MÁS RAPIDO POR VIM CON ',' + 'f'
Plug('neoclide/coc.nvim', {branch= 'release'})               -- SERVIDOR DE AUTOCOMPLETADO. Ver: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
Plug 'vim-scripts/DrawIt'                                   -- DIBUJAR LINEAS
Plug 'gyim/vim-boxdraw'                                     -- DIBUJAR CUADRADOS
Plug 'preservim/tagbar'                                     -- ESQUEMA QUE MUESTRA EN UNA LISTA LOS TIPOS DE VARIABLES Y EL NOMBRE DE LAS VARIABLES DECLARADAS.
if(vim.fn.has('python3')) then
    Plug 'SirVer/ultisnips'                                 -- APP DE SNIPPETS
    Plug 'honza/vim-snippets'                               -- SNIPPETS DE LENGUAJES
end
Plug 'nvim-treesitter/nvim-treesitter'                      -- MEJORA EL DIBUJADO DE LA SINTAXIS
Plug 'nvim-treesitter/nvim-treesitter-context'              -- MUESTRA EN LA PARTE SUPERIOR DENTRO DE LA CLASE, FUNCION, ETC EN LA QUE SE ENCUENTRA
Plug 'mhinz/vim-startify'                                   -- PANTALLA DE INICIO
Plug 'ryanoasis/vim-devicons'                               -- ICONOS PARA NERDTREE SINTAX HIGHLIGHT
Plug 'kyazdani42/nvim-web-devicons'                         -- ICONOS PARA VIM-STARTIFY
Plug 'catppuccin/nvim'                                      -- TEMA CATPUCCIN PARA VIM
Plug 'kshenoy/vim-signature'                                -- PONE A LA IZQUIERDA DE LOS NUMEROS DE LINEA LA MARCA(m[letra]) QUE FUE ASIGNADA A LA LINEA
Plug('folke/tokyonight.nvim', {branch= 'main'})             -- COLORSCHEME DE TOKIO NIGHT
Plug('dracula/vim', { as= 'dracula' })

if vim.fn.isdirectory('/usr/local/opt/fzf') then
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
else
  Plug ('junegunn/fzf', { dir= '~/.fzf', ['do']= './install --bin' })
  Plug 'junegunn/fzf.vim'                                   -- BUSCADOR RAPIDO DE ARCHIVOS
end

vim.g.make = 'gmake'
if vim.fn.exists('make') then
    vim.g.make = 'make'
end

Plug ('vim-scripts/c.vim', {['for']= {'c', 'cpp'}})         -- ESPECIALIZACION EN LENGUAJE C

vim.call('plug#end')

--Requerimiento para vim-colorizer
require'colorizer'.setup()





--*****************************************************************************
-- Plug CONFIG
--*****************************************************************************
-- NERDTREE
    -- Cierre la pestaña si NERDTree es la única ventana que queda en VIM.
    vim.cmd "autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
    -- Muestra Numero de Linea en NERDTree
    vim.cmd "let NERDTreeShowLineNumbers=1"
    -- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    vim.cmd ([[
        autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
        ]])
    vim.cmd "let NERDTreeQuitOnOpen=1" -- Cierra el NerdTree al abrir un archivo
