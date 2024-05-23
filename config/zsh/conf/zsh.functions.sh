function debug_print {
    [ -n "$SHELL_DEBUG" ] && echo "DEBUG: $1"
}

function source_exec {
    debug_print "source_exec: $1"
    [ -f "$1" ] && source "$1"
}

function source_exec_path {
    for file in $SHELL_INIT_PATH/$1/**/*.sh
    do
        debug_print "$1 => $(basename $file .sh)"
        source "$file"
    done
}

function get_secret {
    secret_file="$HOME/.secret/$1"
    if [ -f "$secret_file" ]; then
        cat "$secret_file"
    fi
}

function exit_if_command_not_exists {
    # $1 - command name
    # $2 - exit code (Default: 1)
    local exit_code
    exit_code=${2:=1}
    if [ -z "$1" ]; then
        debug_print "No arguments for exit_if_command_not_exists"
        echo ${exit_code}
    elif [ -z "$(command -v $1)" ]; then
        debug_print "Command '$1' does not exist."
        echo ${exit_code}
    fi
}
