# Fish Shell Configuration
# Gruvbox theme + Starship prompt + Vi mode

# Vi key bindings
fish_vi_key_bindings

if status is-interactive
    # Starship prompt
    if type -q starship
        starship init fish | source
    end
end
