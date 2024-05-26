#!/bin/bash

SSH_KEYGEN="$(which ssh-keygen)"

if [ -z "${SSH_KEYGEN}" ]; then
	echo "ssh-keygen not found."
	exit 1
fi

${SSH_KEYGEN} -t ed25519
