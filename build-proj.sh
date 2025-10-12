#!/bin/bash

SCRIPT_NAME=$(basename "${BASH_SOURCE[0]%.*}")

# Bash Includes
FILE_LOGGING=true
source ./common-utils.sh
component_loc_personal="/opt/personalDev/linux"

build_dir_default="build"
build_dir="${build_dir_default}"

DEBUG=true
TRACE=true

function configEnv()
{
    if [ TRACE ]; then logTrace "configEnv Entered"; fi

    # Set necessary directory additions based on platform
    if [ build_platform_linux == true ]
    then
        build_dir="${build_dir}-Linux"
    elif [ build_platform_windows == true ]
    then
        build_dir="${build_dir}-Windows"
    else
        logError "Invalid Build Platform - Fatal"
        exit 1
    fi

    #set necessary directory additions based on build type

    # Configure toolchain depending on platform (once they are created, and probably going to merge with above plat check :-) )

    if [ TRACE ]; then logTrace "configEnv Exiting"; fi
}

config(){
    if [ TRACE ]; then logTrace "config Entered"; fi

    logInfo "Configuring Project environment"

    #function to validate parameters (cmake build platform, build type assuming ill eventually want to cross compile some stuff)

    #function to create/check build environment

    #create cmake command for config step

    #execute the cmake command (and any potential options)


    # if [ -d $component_loc_personal ]; then
    #     if [ ! -d "${component_loc_personal}/include" ]; then
    #         if [ DEBUG ]; then logDebug "Created missing include directory"; fi
    #         mkdir "${component_loc_personal}/include"
    #     fi
    #     if [ ! -d "${component_loc_personal}/lib" ]; then
    #         if [ DEBUG ]; then logDebug "Created missing lib directory"; fi
    #         mkdir "${component_loc_personal}/lib"
    #     fi
    # else
    #     echo "missing core component base dir: ${comonent_loc_personal}\n\tPlease add this directory manually and retry"
    # fi

    if [ TRACE ]; then logTrace "config Exiting"; fi
}
 
function build()
{
    if [ TRACE ]; then logTrace "build Entered"; fi

    # create cmake build command

    # execute cmake build command

    if [ TRACE ]; then logTrace "build Exiting"; fi
}

function install()
{
    if [ TRACE ]; then logTrace "install Entered"; fi

    # make sure install dirs exist(for libs and headers)

    # cmake install command

    if [ TRACE ]; then logTrace "install Exiting"; fi
}

function clean(){
    if [ TRACE ]; then logTrace "clean Entered"; fi

    # get list of dirs to delete (or define as constants) (must test to see what all config/build artifacts are generated)

    # delete dirs

    if [ TRACE ]; then logTrace "clean Exiting"; fi
}



# FUNCTION TESTING

# logDebug "Debug message test"
# logInfo "Info message test"
# logWarning "Warning message test"
# logError "Error message test"

#Current Test: Trace Statements
clean
config
build
install