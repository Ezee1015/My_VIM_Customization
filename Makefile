REPO_DIR=~/github/My_VIM_Customization
REPO_CONFIG_DIR=${REPO_DIR}/Tema/init
LOCAL_CONFIG_DIR=~/.config/nvim

LUA_CONFIG_FILES=init.lua lua/basic.lua lua/compile.lua lua/maps.lua lua/plugins.lua
PLUGIN_CONFIG_FILES=lua/plugins/bufline.lua lua/plugins/git.lua lua/plugins/markdown.lua lua/plugins/startify.lua lua/plugins/zen-mode.lua lua/plugins/colorscheme.lua lua/plugins/init.lua lua/plugins/mason.lua lua/plugins/telescope.lua lua/plugins/commentary.lua lua/plugins/lsp.lua lua/plugins/nvim-tree.lua lua/plugins/treesitter.lua lua/plugins/dap.lua lua/plugins/lualine.lua lua/plugins/oil.lua lua/plugins/venn.lua
SPELL_FILE=spell/es.utf-8.add

REPO_DOC_FILE=${REPO_DIR}/Documentacion/Neovim\ -\ Documentación.md
LOCAL_DOC_FILE=${LOCAL_CONFIG_DIR}/documentacion.md
REPO_DOC_PDF=${REPO_DIR}/Documentacion/Neovim\ -\ Documentación\ -\ Dark.pdf ${REPO_DIR}/Documentacion/Neovim\ -\ Documentación\ -\ Light.pdf

APT_PACKAGES=vim curl vim-gtk openjdk-17* xdotool curl python3 universal-ctags gdb ripgrep python-pynvim
PACMAN_PACKAGES=neovim xclip xorg-xclipboard vim xdotool python3 ctags jdk17-openjdk lua-language-server gdb ripgrep ttf-hack-nerd python-pynvim
ZYPPER_PACKAGES=neovim xclip xclipboard vim xdotool python3 ctags lua-language-server gdb ripgrep nerd-font-hack python-pynvim

# Updates and install the lua files from the repository
install:
	@sudo apt install ${APT_PACKAGES} ||  \
	sudo pacman -S ${PACMAN_PACKAGES} || \
	sudo zypper install ${ZYPPER_PACKAGES}
	# pip install -U neovim || pip3 install -U neovim
	@if [ ! -d ${LOCAL_CONFIG_DIR} ]; then mkdir ${LOCAL_CONFIG_DIR}; fi
	@cp -r ${REPO_CONFIG_DIR}/* ${LOCAL_CONFIG_DIR}/
	@cp ${REPO_DOC_FILE} ${LOCAL_DOC_FILE}
	@cp ${REPO_DOC_PDF} ~/
	$(info *****************************************************************************************)
	$(info Consideraciones...")
	$(info   - En Debian o derivadas, instale una fuente de NerdFonts y seleccionela en su terminal (Ejemplo: Hack Font - https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip\)")
	$(info   - En Debian o derivadas, instale el paquete 'lua-language-server' e instale Neovim desde HomeBrew u otro gestor de paquetes")
	$(info   - Lenguajes Soportados por Treesitter: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages")
	$(info *****************************************************************************************)

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
