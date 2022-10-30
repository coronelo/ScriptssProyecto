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
function printTable(){

    local -r delimiter="${1}"
    local -r data="$(removeEmptyLines "${2}")"

    if [[ "${delimiter}" != '' && "$(isEmptyString "${data}")" = 'false' ]]
    then
        local -r numberOfLines="$(wc -l <<< "${data}")"

        if [[ "${numberOfLines}" -gt '0' ]]
        then
            local table=''
            local i=1

            for ((i = 1; i <= "${numberOfLines}"; i = i + 1))
            do
                local line=''
                line="$(sed "${i}q;d" <<< "${data}")"

                local numberOfColumns='0'
                numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<< "${line}")"

                if [[ "${i}" -eq '1' ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi

                table="${table}\n"

                local j=1

                for ((j = 1; j <= "${numberOfColumns}"; j = j + 1))
                do
                    table="${table}$(printf '#| %s' "$(cut -d "${delimiter}" -f "${j}" <<< "${line}")")"
                done

                table="${table}#|\n"

                if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi
            done

            if [[ "$(isEmptyString "${table}")" = 'false' ]]
            then
                echo -e "${table}$reset" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1'
            fi
        fi
    fi
}
function removeEmptyLines(){

    local -r content="${1}"
    echo -e "${content}" | sed '/^\s*$/d'
}

function repeatString(){

    local -r string="${1}"
    local -r numberToRepeat="${2}"

    if [[ "${string}" != '' && "${numberToRepeat}" =~ ^[1-9][0-9]*$ ]]
    then
        local -r result="$(printf "%${numberToRepeat}s")"
        echo -e "${result// /${string}}"
    fi
}

function isEmptyString(){

    local -r string="${1}"

    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}

function trimString(){

    local -r string="${1}"
    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}
printTable ";" "${blanco}${negrita}Tarea;Técnico;Documentación;Estado$reset
Configurar RAID servidor;${verde}${negrita}${verde}${negrita}Javi$reset$blanco$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco$blanco
Instalar Ubuntu servidor;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Instalar ssh;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Actualizar servidor;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Configuración fecha y hora;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Fijar IP servidor;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Configurar nombre del host;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Instalar GUI ligero;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Programar tarea apagado automático;${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Activar usuario root;${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Instalar virtualbox;${verde}${negrita}Javi$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Instalar Maquina ubuntu server;${verde}${negrita}Javi$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Instalar Maquina Windows server;${amarillo}${negrita}Fran$reset$blanco;;Pendiente
Agregar 3 usuarios para los técnicos con permisos;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Configuración ssh para limitar tiempo de inactividad y máximo de usuarios simultáneos;${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Configurar wake-on-lan;${amarillo}${negrita}Fran$reset$blanco;;Pendiente
Crear imagen clonezilla;${verde}${negrita}Javi$reset$blanco;;Pendiente
Configurar SSH para entorno gráfico;${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Configuración del LVM;${verde}${negrita}Javi$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Caducidad de cuenta y contraseña en próximo login de usuarios;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Sistema de ficheros;Sin asignar;;Pendiente
Script para backups;${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Script para actualizar;${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Script logo;${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;Pendiente
neofetch(app para que nos muestre los datos de sistema);${amarillo}${negrita}Fran$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Instalación y configuración de xRDP;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;${verde}Terminada$blanco
Crear grupo para tecnicos;${azul}${negrita}Lucia$reset$blanco;${cyan}${negrita}Documentación$reset$blanco;Pendiente$reset"