
PYENV="$(which pyenv)"

if [ -z "${PYENV}" ]; then
    exit 1
fi

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
