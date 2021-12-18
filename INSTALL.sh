#!/bin/bash

function INSTALAR {

     sudo apt install vim curl vim-gtk -y
     cp Tema/vimrc ~/.vimrc
     cp -rf Tema/colors/* ~/.vim/colors/
     cp Tema/vim_forever.sh ~/.vim_forever.sh
     cp Documentacion/VIM\ -\ Documentacion.pdf ~/
     mkdir ~/.vim
     mkdir ~/.vim/colors
     mkdir ~/.vim/undodir
     mkdir ~/.vim/after
     mkdir ~/.vim/after/plugin
     echo "autocmd StdinReadPre * let s:std_in=1" > ~/.vim/after/plugin/NERDTreeAutoExecute.vim
     echo "autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | silent NERDTree | endif" >> ~/.vim/after/plugin/NERDTreeAutoExecute.vim
     echo ""
     sudo mkdir /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font
     sudo cp Tema/ttf/*.ttf /usr/share/fonts/truetype/Ubuntu__Mono_Nerd_Font/

     if [ -e /bin/vi ] || [ -e /usr/vi ] ; then echo "" ; else
         sudo ln -s /bin/vim /bin/vi
     fi

     if [ -e /bin/nvim ] ; then
             mkdir ~/.config/nvim
             cp Tema/init.vim ~/.config/nvim/init.vim
    else
         if [ -e /usr/nvim ] ; then
             mkdir ~/.config/nvim
             cp Tema/init.vim ~/.config/nvim/init.vim
        fi
     fi

     echo ""
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
