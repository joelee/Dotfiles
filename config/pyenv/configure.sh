#!/bin/bash

PYTHON_VERSION="3.12.3"

PYENV="$(which pyenv)"

if [ -z "${PYENV}" ]; then
	echo "PyEnv was not installed."
	exit 1
fi

${PYENV} install ${PYTHON_VERSION}
${PYENV} global ${PYTHON_VERSION}
