
if type -q fisher
    echo "Installing extensions via Fisher..."
    fisher install jorgebucaran/nvm.fish
else
    echo "Fisher was not installed."
end

fish_add_path /opt/homebrew/bin

fish_update_completions
