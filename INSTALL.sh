#!/bin/bash

function INSTALAR {

    sudo apt install vim curl vim-gtk clangd-12 openjdk-17* clangd xdotool curl python3 universal-ctags -y
    sudo apt install vim curl vim-gtk clangd-11 openjdk-17* clangd xdotool curl python3 universal-ctags -y
        # ADICIONAL PARA EDICION EN MARKDOWN
        #sudo apt install pandoc markdown texlive-base
        # sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
    sudo pacman -S neovim xclip xorg-xclipboard gvim clang xdotool python3 ctags
    sudo zypper install neovim xclip xclipboard vim clang xdotool python3 ctags
    pip install -U neovim
    pip3 install -U neovim
        # ADICIONAL PARA EDICION EN MARKDOWN
        #sudo pacman -S pandoc markdown texlive-core
    curl -sL install-node.vercel.app/lts | sudo bash
    cp Tema/vimrc ~/.vimrc
    cp -rf Tema/colors/* ~/.vim/colors/
    wget https://raw.githubusercontent.com/gruvbox-community/gruvbox/master/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim
    cp Tema/autostart/onedark.vim ~/.vim/autostart/
    cp Tema/vim_forever.sh ~/.vim_forever.sh
    cp Documentacion/VIM\ -\ Documentacion.pdf ~/
    mkdir ~/.vim
    mkdir ~/.vim/colors
    mkdir ~/.vim/undodir
    mkdir ~/.vim/after
    mkdir ~/.vim/after/plugin
    # echo "autocmd StdinReadPre * let s:std_in=1" > ~/.vim/after/plugin/NERDTreeAutoExecute.vim
    # echo "autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | silent NERDTree | endif" >> ~/.vim/after/plugin/NERDTreeAutoExecute.vim
    echo ""
    sudo mkdir /usr/share/fonts/truetype
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
     echo "           Solamente queda unas cosas..."
     echo "                     * Abra con VIM, NO CON NEOVIM la primera vez"
     echo "                     * Seleccione en su terminal la fuente UbuntuMono Nerd Font Mono"
     echo "                     * Ejecute vim y teclee :CocInstall coc-json coc-tsserver coc-java coc-clangd"
     echo "                     * Luego ejecute :CocCommand clangd.install desde vim abierto en un proyecto/archivo de C"
     echo "                     * Si da error en el Servidor de lenguaje Java, poner el contenido del archivo https://download.eclipse.org/jdtls/milestones/0.57.0/ en ~/.config/coc/extensions/coc-java-data/server/ (eliminando lo que hab??a en esa carpeta)"
     echo "                     * Para actualizar todos los componenetes de vim ejecute :PlugUpdate :PlugUpgrade :CocUpdate"
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
        * )     echo "           Se ha elegido que NO. Se saldr?? del Instalador." ;;
    esac

    echo "" ; echo ""

}

MENU
exit
# AVISO QUE ENCONTRE EN INTERNET
# SI NO FUNCIONA PYTHON3, HACER: pip3 install pynvim
# Y USAR NEOVIM
