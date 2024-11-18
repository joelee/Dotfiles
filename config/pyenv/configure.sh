#!/bin/bash

PYTHON_VERSION="3.12.7"
PYTHON_DEV_VERSION="3.13.0"

PYENV="$(which pyenv)"

if [ -z "${PYENV}" ]; then
	echo "PyEnv was not installed."
	exit 1
fi

${PYENV} install ${PYTHON_VERSION}
${PYENV} install ${PYTHON_DEV_VERSION}
${PYENV} global ${PYTHON_VERSION}
