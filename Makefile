REPO_DIR=~/github/My_VIM_Customization
REPO_CONFIG_DIR=${REPO_DIR}/Tema/init
LOCAL_CONFIG_DIR=~/.config/nvim

LUA_CONFIG_FILES=init.lua lua/basic.lua lua/compile.lua lua/maps.lua lua/plugins.lua
PLUGIN_CONFIG_FILES=lua/plugins/bufline.lua lua/plugins/git.lua lua/plugins/markdown.lua lua/plugins/startify.lua lua/plugins/zen-mode.lua lua/plugins/colorscheme.lua lua/plugins/init.lua lua/plugins/mason.lua lua/plugins/telescope.lua lua/plugins/commentary.lua lua/plugins/lsp.lua lua/plugins/nvim-tree.lua lua/plugins/treesitter.lua lua/plugins/dap.lua lua/plugins/lualine.lua lua/plugins/oil.lua lua/plugins/venn.lua
SPELL_FILE=/spell/es.utf-8.add

REPO_DOC_FILE=${REPO_DIR}/Documentacion/Neovim\ -\ Documentación.md
LOCAL_DOC_FILE=${LOCAL_CONFIG_DIR}/documentacion.md

# Updates and install the lua files from the repository
install:
	sudo apt install neovim vim curl vim-gtk openjdk-17* xdotool curl python3 universal-ctags gdb ripgrep -y
	sudo pacman -S neovim xclip xorg-xclipboard vim xdotool python3 ctags jdk17-openjdk lua-language-server gdb ripgrep
	sudo zypper install neovim xclip xclipboard vim xdotool python3 ctags lua-language-server gdb ripgrep
	pip install -U neovim
	pip3 install -U neovim
	mkdir ~/.config/nvim/
	cp -r Tema/init/* ~/.config/nvim/
	cp Documentacion/Neovim\ -\ Documentación\ -\ *.pdf ~/
	cp Documentacion/Neovim\ -\ Documentación.md ~/.config/nvim/documentacion.md
	sudo mkdir /usr/share/fonts/truetype
	sudo mkdir /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font
	sudo cp Tema/ttf/*.ttf /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font/
	echo ""
	echo ""
	echo "           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador..."
	echo "           Solamente queda unas cosas a consideración..."
	echo "                     * Si está en Debian o derivada, instale el paquete 'lua-language-server'"
	echo "                     * Seleccione en su terminal la fuente UbuntuMono Nerd Font Mono"
	echo "                     * Para Instalar el soporte de TreeSitter :TSInstall java :TSInstall c "
	echo "                     * Si no funciona python3, ejecutar: pip3 install pynvim"
	echo "                     * Lenguajes Soportados por Treesitter: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages"

# Updates and shows the diff with the repository lua's files
diff:
	cd ${REPO_DIR} && git pull
	# Archivos de configuraciones de Neovim
	for i in ${LUA_CONFIG_FILES} ; do                          \
		LOCAL_FILE=${LOCAL_CONFIG_DIR}/$$i;                      \
		REPO_FILE=${REPO_CONFIG_DIR}/$$i;                        \
		if [ ! -z "$$(diff $$LOCAL_FILE $$REPO_FILE)" ]; then    \
			nvim -d $$LOCAL_FILE $$REPO_FILE ;                     \
		fi;                                                      \
	done
	# Archivos de configuraciones de PLUGINS
	for i in ${PLUGIN_CONFIG_FILES} ; do                       \
		LOCAL_FILE=${LOCAL_CONFIG_DIR}/$$i;                      \
		REPO_FILE=${REPO_CONFIG_DIR}/$$i;                        \
		if [ ! -z "$$(diff  $$LOCAL_FILE $$REPO_FILE)" ]; then   \
			nvim -d $$LOCAL_FILE $$REPO_FILE;                      \
		fi;                                                      \
	done
	# Documentación
	if [ ! -z "$(diff ${LOCAL_DOC_FILE} ${REPO_DOC_FILE})" ]; then \
		nvim -d ${LOCAL_DOC_FILE} ${REPO_DOC_FILE};                  \
	fi
	# Diccionario personal
	for i in ${SPELL_FILE} ; do                                \
		LOCAL_FILE=${LOCAL_CONFIG_DIR}/$$i;                      \
		REPO_FILE=${REPO_CONFIG_DIR}/$$i;                        \
		if [ ! -z "$$(diff $$LOCAL_FILE $$REPO_FILE)" ]; then    \
			nvim -d $$LOCAL_FILE $$REPO_FILE;                      \
		fi;                                                      \
	done

# Updates and send to the repository the lua files
sync:
	# Elimina configuración del repo
	rm -rf ~/github/My_VIM_Customization/Tema/init/*
	rm ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md
	# Copia la configuración
	cd ~/.config/nvim/
	cp -r init.lua lua ~/github/My_VIM_Customization/Tema/init/
	mkdir ~/github/My_VIM_Customization/Tema/init/spell/
	cp spell/*.add ~/github/My_VIM_Customization/Tema/init/spell/
	cp documentacion.md ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md

# Updates from the repository the lua files. DESTRUCTIVE!!!
update:
	cd ~/github/My_VIM_Customization
	git pull
	cp -r Tema/init/* ~/.config/nvim/
	cp Documentacion/Neovim\ -\ Documentación.md ~/.config/nvim/documentacion.md
