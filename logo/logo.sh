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

echo -e "\t\t\t${amarillo}[!]${reset} ${rojo}${negrita}PROYECTO DE:${reset}"
sleep 0.5
echo -e "${azul}${negrita}${italica}			LUCIA ORTEGA RODRIGUEZ	${reset}"
sleep 0.5
echo -e "${verde}${negrita}${italica}			JAVIER RODRIGUEZ PARRA	${reset}"
sleep 0.5
echo -e "${amarillo}${negrita}${italica}			FRANCISCO MORENO RODRIGO	${reset}"
sleep 0.5
echo -e "${cyan}${negrita}${italica}############### Ultimas Actualizaciones ###############${reset}"
logupgrade=$(cat /Actualizaciones/logupgrade |tail -n 1)
sleep 0.5
echo -e "$f_azul $logupgrade$reset"
