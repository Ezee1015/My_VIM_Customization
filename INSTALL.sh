#!/bin/bash

function INSTALAR {

     cp Tema/vimrc ~/.vimrc
     cp -rf Tema/colors/* ~/.vim/colors
     mkdir ~/.vim/undodir
     sudo mkdir /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font
     sudo cp Tema/Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono.ttf /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font/
     echo "           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador..."
     echo "           Solamente queda una cosa..."
     echo "                     * Seleccione en su terminal la fuente UbuntuMono Nerd Font Mono"
 
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
