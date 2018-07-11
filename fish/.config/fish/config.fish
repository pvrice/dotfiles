if status --is-interactive
    env SHELL=/usr/bin/fish keychain --agents gpg,ssh --eval --quiet --noask -Q id_rsa | source
end
