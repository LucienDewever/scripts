#!/bin/bash

color_Red='\033[0;31m'
color_Black='\033[0;30m'
color_Green='\033[0;32m'
color_Yellow='\033[0;33m'
color_Blue='\033[0;34m'
color_Magenta='\033[0;35m'
color_Cyan='\033[0;36m'
color_White='\033[0;37m'
color_Reset='\033[0;0m'

# Logging Functions

function logDebug(){
    local msg=$1

    echo -e "${color_Cyan}================== [DEBUG]: ${msg} ==================${color_Reset}"
}

function logInfo(){
    local msg=$1

    echo -e "${color_Green}================== [DEBUG]: ${msg} ==================${color_Reset}"
}

function logWarning(){
    local msg=$1

    echo -e "${color_Yellow}================== [DEBUG]: ${msg} ==================${color_Reset}"
}

function logError(){
    local msg=$1

    echo -e "${color_Cyan}================== [DEBUG]: ${msg} ==================${color_Reset}"
}
