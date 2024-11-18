#/bin/bash

PYENV="$(which pyenv)"

if [ ! -e "${PYENV}" ]; then
    echo "PyEnv was not installed"
    exit 1
fi

${PYENV} install 3.11.10
${PYENV} install 3.12.7
${PYENV} install 3.13.0

${PYENV} global 3.12.7

