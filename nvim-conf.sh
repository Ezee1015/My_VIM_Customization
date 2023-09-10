#!/bin/bash

if [ "$1" == "diff" ]; then
  # Actualiza los repos
  cd ~/github/My_VIM_Customization
  git pull

  # init.lua
  cd ~/.config/nvim/
  if [ ! -z "$(diff init.lua ~/github/My_VIM_Customization/Tema/init/init.lua)" ]; then
    nvim -d init.lua ~/github/My_VIM_Customization/Tema/init/init.lua
  fi

  # Documentación
  if [ ! -z "$(diff documentacion.md ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md)" ]; then
    nvim -d documentacion.md ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md
  fi

  # Archivos de configuraciones
  LUACONFIG=$(ls lua/*.lua)
  for i in $LUACONFIG ; do
    if [ ! -z "$(diff $i ~/github/My_VIM_Customization/Tema/init/$i)" ]; then
      nvim -d $i ~/github/My_VIM_Customization/Tema/init/$i
    fi
  done

  # Archivos de configuraciones de PLUGINS
  LUACONFIG=$(ls lua/plugins/*.lua)
  for i in $LUACONFIG ; do
    if [ ! -z "$(diff $i ~/github/My_VIM_Customization/Tema/init/$i)" ]; then
      nvim -d $i ~/github/My_VIM_Customization/Tema/init/$i
    fi
  done

  # Diccionario personal
  DICCIONARIO=$(ls spell/*.add)
  for i in $DICCIONARIO ; do
    if [ ! -z "$(diff $i ~/github/My_VIM_Customization/Tema/init/$i)" ]; then
      nvim -d $i ~/github/My_VIM_Customization/Tema/init/$i
    fi
  done
  exit
fi

if [ "$1" == "sync" ]; then
  # Elimina configuración del repo
  rm -rf ~/github/My_VIM_Customization/Tema/init/*
  rm ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md

  # Copia la configuración
  cd ~/.config/nvim/
  cp -r init.lua lua ~/github/My_VIM_Customization/Tema/init/
  mkdir ~/github/My_VIM_Customization/Tema/init/spell/
  cp spell/*.add ~/github/My_VIM_Customization/Tema/init/spell/
  cp documentacion.md ~/github/My_VIM_Customization/Documentacion/Neovim\ -\ Documentación.md
  exit
fi

if [ "$1" == "install" ]; then
  cd ~/github/My_VIM_Customization
  git pull
  cp -r Tema/init/* ~/.config/nvim/
  cp Documentacion/Neovim\ -\ Documentación.md ~/.config/nvim/documentacion.md
  exit
fi

echo "nvim-conf [command]"
echo ""
echo "    This command updates the git repository (~/github/My_VIM_Customization/) and send, receive or show the diff of the local configuration files of the Neovim configuration with the repository's one"
echo ""
echo "Commands:"
echo "    install ............ Updates and install the lua files from the repository"
echo "    sync    ............ Updates and send to the repository the lua files"
echo "    diff    ............ Updates and shows the diff with the repository lua's files"
exit
