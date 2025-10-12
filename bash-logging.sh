#!/bin/bash

# Check for inclusion
if [ -z "${PERF_LOGGING}" ]; then
PERF_LOGGING=true

# Determine whether file using this script wants logs in a file as well
if [ "${FILE_LOGGING}" != false ]; then
    # Log directory and name defines
    ROOT_LOG_DIR=/tmp/${SCRIPT_NAME}Logs
    LOG_DATE=$(date +%Y%m%d)
    LOG_FILE=${ROOT_LOG_DIR}/${LOG_DATE}-${SCRIPT_NAME}.log

    # Create the Root log directory if it doesnt already exist
    if [ ! -d "${ROOT_LOG_DIR}" ]; then
        mkdir -p "${ROOT_LOG_DIR}"
        if [ debug ]; then logDebug "Creating '${ROOT_LOG_DIR}' - Status: ${?}"; fi
    fi
fi

# Color escape sequences
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
function logMessage()
{
    # Capture arguments for better code readability
    local msg=$1
    local color=$2
    local level=$3

    # Construct message to log
    local output="${color}==== [${level}]: ${msg} ==================${color_Reset}\n"

    # Log to console (and file if enabled)
    if [ "${FILE_LOGGING}" != false ]; then
        printf "$output" | tee -a "${LOG_FILE}"
    else
        printf "${output}"
    fi

}

function logTrace(){
    logMessage "${@}" "${color_White}" "TRACE"
}

function logDebug(){
    logMessage "${@}" "${color_Cyan}" "DEBUG"
}

function logInfo(){
    logMessage "${@}" "${color_Green}" "INFO"
}

function logWarning(){
    logMessage "${@}" "${color_Yellow}" "WARNING"
}

function logError(){
    logMessage "${@}" "${color_Red}" "ERROR"
}

# End inclusion check
fi