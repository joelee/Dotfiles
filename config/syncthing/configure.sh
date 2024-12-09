#!/bin/bash
# Syncthing configuration set up

BASE_PATH="$(dirname $0)"

source "$BASE_PATH/../../common/common_functions.bash"

if [ -z "$(which syncthing)" ]; then
    echo "Syncthing is not installed. Attempt to install..."
    install_package syncthing
    ret = $?
    if [ ${ret} -ne 0 ]; then
        echo "Failed to install package!"
        exit ${ret}
    fi
fi

if [ "${OS_TAG}" == "arch" ]; then
    sudo systemctl enable syncthing@${USER}.service
    sudo systemctl start syncthing@${USER}.service
    echo " "
    echo "Configure Syncthing at: http://localhost:8384"
fi

