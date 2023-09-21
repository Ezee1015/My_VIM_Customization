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
	# Actualiza los repos
	cd ~/github/My_VIM_Customization
	git pull
	# init.lua
	cd ~/.config/nvim/
	if [ ! -z "$(diff init.lua ~/github/My_VIM_Customization/Tema/init/init.lua)" ]; then \
		nvim -d init.lua ~/github/My_VIM_Customization/Tema/init/init.lua; \
	fi
	# Documentación
	if [ ! -z "$(diff documentacion.md ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md)" ]; then \
		nvim -d documentacion.md ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md; \
	fi
	# Archivos de configuraciones
	LUACONFIG=$(ls lua/*.lua)
	for i in $LUACONFIG ; do \
		if [ ! -z "$(diff $i ~/github/My_VIM_Customization/Tema/init/$i)" ]; then \
			nvim -d $i ~/github/My_VIM_Customization/Tema/init/$i; \
		fi; \
	done
	# Archivos de configuraciones de PLUGINS
	LUACONFIG=$(ls lua/plugins/*.lua)
	for i in $LUACONFIG ; do \
		if [ ! -z "$(diff $i ~/github/My_VIM_Customization/Tema/init/$i)" ]; then \
			nvim -d $i ~/github/My_VIM_Customization/Tema/init/$i; \
		fi \
	done
	# Diccionario personal
	DICCIONARIO=$(ls spell/*.add)
	for i in $DICCIONARIO ; do \
		if [ ! -z "$(diff $i ~/github/My_VIM_Customization/Tema/init/$i)" ]; then \
			nvim -d $i ~/github/My_VIM_Customization/Tema/init/$i; \
		fi \
	done

# Updates and send to the repository the lua files
to_repo:
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
