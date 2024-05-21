
if type -q starship
    starship init fish | source
else
    echo "Starship was not installed."
end
