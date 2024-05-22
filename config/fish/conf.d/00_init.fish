
if test -z $DOTFILES_HOME
    if test -e $HOME/Dotfiles/init.sh
        set -Ux DOTFILES_HOME $HOME/Dotfiles
    else if test -e $HOME/.dotfiles/init.sh
        set -Ux DOTFILES_HOME $HOME/.dotfiles
    else
        echo "WARNING: Unable to find DOTFILES_HOME !"
    end
end
