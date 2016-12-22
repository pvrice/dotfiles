if status --is-interactive
    keychain --eval --quiet --noask id_rsa | source
end

fish_vi_key_bindings
