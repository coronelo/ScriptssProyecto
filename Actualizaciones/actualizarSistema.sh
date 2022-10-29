#!/bin/bash

esc="" # si esto no funciona probar "^[" que es ctrl+v+ESC
 
    negro="${esc}[30m"
    rojo="${esc}[31m"
    verde="${esc}[32m"
    amarillo="${esc}[33m"
    azul="${esc}[34m"
    rosa="${esc}[35m"
    cyan="${esc}[36m"
    blanco="${esc}[37m"
 
    f_negro="${esc}[40m"
    f_rojo="${esc}[41m"
    f_verde="${esc}[42m"
    f_amarllo="${esc}[43m"
    f_azul="${esc}[44m"
    f_rosa="${esc}[45m"
    f_cyan="${esc}[46m"
    f_blanco="${esc}[47m"
 
    negrita="${esc}[1m"
    q_negrita="${esc}[22m"
    italica="${esc}[3m"
    q_italica="${esc}[23m"
    subrayado="${esc}[4m"
    q_subrayado="${esc}[24m"
    inverso="${esc}[7m"
    q_inverso="${esc}[27m"
 
    reset="${esc}[0m"

function actualizar(){

if [[ $(id -u) = 0 ]]; then
	echo -e "$verde$negrita Actualizando el sistema... $reset$verde" 
	apt autoremove -y
	apt autoclean -y
	apt autopurge -y
	if [[ !(-d /Actualizaciones) ]]; then
		mkdir /Actualizaciones	
	fi
	apt update -y 1>/Actualizaciones/logupdate 2>/Actualizaciones/erroresupdate
	apt upgrade -y 1>/Actualizaciones/logupgrade 2>/Actualizaciones/errorupgrade
	echo -e "$rosa$negrita ACTUALIZACION FINALIZADA $reset" 
	exit 1
else
	echo -e "$rojo Este script se debe iniciar como root, pruebe con sudo y el nombre del script$reset"
	exit 0
fi
}
actualizar