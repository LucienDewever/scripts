#!/bin/bash

source ./bash-logging.sh

# Common Utils defines
build_Platform_linux_defualt=false
build_platform_linux=${build_platform_linux_defualt}

build_platform_windows_defualt=false
build_platform_windows=${build_platform_windows_defualt}

build_type_debug_default=false
build_type_debug=build_type_debug_default

build_type_release_default=false
build_type_release=build_type_release_default




function checkBuildPlatform()
{
    retVal=0
    if [ build_platform_linux == false ] && [ build_platform_windows == false ]
    then
        retval=1
        logError "Build Platform invalid or not selected"
    fi

    return ${retVal}
}

function checkBuildType()
{
    retVal=0
    if [ build_type_debug == false ] && [ build_type_release == false ]
    then
        retval=1
        logError "Build type invalid or not selected"
    fi

    return ${retVal}
}

function verifyBuildParameters()
{
    checkBuildPlatform
    if [ $? != 0 ]; then exit 1; fi

    checkBuildType
    if [ $? != 0 ]; then exit 1; fi
}