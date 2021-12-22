#!/bin/bash

function SEGUIR_EN_VIM {

        clear

        echo ""
        echo "Desea seguir ejecutando VIM? (S/N) > "
        read ELECCION

        case $ELECCION in
            's' )   vim $* ; SEGUIR_EN_VIM  ;;
            'si' )  vim $* ; SEGUIR_EN_VIM  ;;
            'Si' )  vim $* ; SEGUIR_EN_VIM  ;;
            'sI' )  vim $* ; SEGUIR_EN_VIM  ;;
            'SI' )  vim $* ; SEGUIR_EN_VIM  ;;
            'y' )   vim $* ; SEGUIR_EN_VIM  ;;
            'yes' ) vim $* ; SEGUIR_EN_VIM  ;;
            'YES' ) vim $* ; SEGUIR_EN_VIM  ;;
            '1' )   vim $* ; SEGUIR_EN_VIM  ;;
            'S' )   vim $* ; SEGUIR_EN_VIM  ;;
            * )     clear ; echo "" ; echo "           Se ha elegido que NO." ; TERMINAR ;;
        esac

}

function TERMINAR {

    clear

    echo ""
    echo "Desea Salir a la Terminal? Sino se Saldrá del Programa (S/N) > "
    read ELECCION

    case $ELECCION in
        's' )   bash  ; SEGUIR_EN_VIM ;;
        'si' )  bash  ; SEGUIR_EN_VIM ;;
        'Si' )  bash  ; SEGUIR_EN_VIM ;;
        'sI' )  bash  ; SEGUIR_EN_VIM ;;
        'SI' )  bash  ; SEGUIR_EN_VIM ;;
        'y' )   bash  ; SEGUIR_EN_VIM ;;
        'yes' ) bash  ; SEGUIR_EN_VIM ;;
        'YES' ) bash  ; SEGUIR_EN_VIM ;;
        '1' )   bash  ; SEGUIR_EN_VIM ;;
        'S' )   bash  ; SEGUIR_EN_VIM ;;
        * )     echo "           Se ha elegido que NO. Se saldrá de la Terminal." ; exit ;;
    esac

}


vim $*
SEGUIR_EN_VIM
