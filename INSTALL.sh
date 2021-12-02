#!/bin/bash

cd $(dirname $0)
KernelOS=$(uname)

function INSTALAR {

     cp -rf Tema/colors/* ~/.vim/colors
     mkdir ~/.vim/undodir

     echo "           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador..."
     echo "           Solamente queda..."
     echo "                     * Seleccione en su terminal la fuente UbuntuMono Nerd Font Mono"
    
     case $KernelOS in
         Linux)
             cp Tema/vimrc ~/.vimrc
             sudo apt update && sudo apt install nodejs -y
             sudo mkdir /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font
             sudo cp Tema/ttf/*.ttf /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font/
         ;;
         Darwin)
             cp Tema/vimrc_mac ~/.vimrc
             echo "                     * Instale la fuente que está dentro de la carpeta Tema/ttf"
         ;;
         *)
             echo "Error identificando su sistema operativo. Su Kernel es: $KernelOS y no fue probado este script en ese kernel.";
             read RESPONSE
             exit
         ;;
     esac


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
