
if type -q fisher
    echo "Installing extensions via Fisher..."
    fisher install jorgebucaran/nvm.fish   # nvm support
    fisher install edc/bass                # Run bash script in fish 
else
    echo "Fisher was not installed."
end

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin

fish_update_completions
