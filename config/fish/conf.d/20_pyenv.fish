
if type -q pyenv
    if status is-interactive
        set -Ux PYENV_ROOT $HOME/.pyenv
        fish_add_path $PYENV_ROOT/bin
    end
    pyenv init - | source
else
    echo "PyEnv was not installed."
end
