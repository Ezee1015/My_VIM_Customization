#!/bin/bash

clear

for number in {0..10}; do
    echo ""
done

read -p "Desea Instalar Mi Configuracion de VIM? (S/N)>  " respuesta

case $respuesta in
    's' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'si' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'Si' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'sI' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'SI' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'y' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'yes' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'YES' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    1 ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    'S' ) clear; cp Tema/vimrc ~/.vimrc && cp -r Tema/colors ~/.vim/ ; echo -n "\n\n           Se ha instalado Correctamente en el VIM del Usuario. Terminando el Instalador...\n\n" ;;
    * ) echo -n "\n\n           Se ha elegido que NO. Se saldrá del Instalador.\n\n";;
esac
