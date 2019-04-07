if status --is-interactive && which keychain > /dev/null 2>&1
    env SHELL=/usr/bin/fish keychain --agents gpg,ssh --eval --noask --quiet -Q id_rsa | source
end
