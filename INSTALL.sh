#!/bin/bash

function INSTALAR {

    sudo apt install neovim vim curl vim-gtk openjdk-17* xdotool curl python3 universal-ctags gdb -y
    sudo pacman -S neovim xclip xorg-xclipboard vim xdotool python3 ctags jdk17-openjdk lua-language-server gdb
    sudo zypper install neovim xclip xclipboard vim xdotool python3 ctags lua-language-server gdb
    pip install -U neovim
    pip3 install -U neovim
    # curl -sL install-node.vercel.app/lts | sudo bash
    mkdir ~/.config/nvim/
    cp -r Tema/init/* ~/.config/nvim/
    cp Documentacion/Neovim\ -\ Documentacion.pdf ~/
    sudo mkdir /usr/share/fonts/truetype
    sudo mkdir /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font
    sudo cp Tema/ttf/*.ttf /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font/

     echo ""
     echo ""
     echo "           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador..."
     echo "           Solamente queda unas cosas..."
     echo "                     * Si está en Debian o derivada, instale el paquete 'lua-language-server'"
     echo "                     * Seleccione en su terminal la fuente UbuntuMono Nerd Font Mono"
     echo "                     * Para Instalar el soporte de TreeSitter :TSInstall java :TSInstall c " # Lenguajes Soportados: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
}


function MENU {

    clear

    for number in {0..10}; do
        echo ""
    done

    echo "" ; echo ""
    read -p "Desea Instalar Mi Configuracion de VIM? (S/N)>  " respuesta
    clear
    echo "" ; echo ""

    case $respuesta in
        's' )   INSTALAR  ;;
        'si' )  INSTALAR  ;;
        'Si' )  INSTALAR  ;;
        'sI' )  INSTALAR  ;;
        'SI' )  INSTALAR  ;;
        'y' )   INSTALAR  ;;
        'yes' ) INSTALAR  ;;
        'YES' ) INSTALAR  ;;
        '1' )   INSTALAR  ;;
        'S' )   INSTALAR  ;;
        * )     echo "           Se ha elegido que NO. Se saldrá del Instalador." ;;
    esac

    echo "" ; echo ""

}

MENU
exit
# AVISO QUE ENCONTRE EN INTERNET
# SI NO FUNCIONA PYTHON3, HACER: pip3 install pynvim
# Y USAR NEOVIM
