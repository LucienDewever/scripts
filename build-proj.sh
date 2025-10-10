#!/bin/bash

SCRIPT_NAME=$(basename "${BASH_SOURCE[0]%.*}")

# Bash Includes
FILE_LOGGING=true
source ./common-utils.sh
component_loc_personal="/opt/personalDev/linux"
true=1
false=0
debug=true

logDebug "Debug message test"
logInfo "Info message test"
logWarning "Warning message test"
logError "Error message test"

config(){
    if [ -d $component_loc_personal ]; then
        if [ ! -d "${component_loc_personal}/include" ]; then
            if [ debug ]; then logDebug "Created missing include directory"; fi
            mkdir "${component_loc_personal}/include"
        fi
        if [ ! -d "${component_loc_personal}/lib" ]; then
            if [ debug ]; then logDebug "Created missing lib directory"; fi
            mkdir "${component_loc_personal}/lib"
        fi
    else
        echo "missing core component base dir: ${comonent_loc_personal}\n\tPlease add this directory manually and retry"
    fi
}

# build(){

# }

# clean(){
    
# }

#config