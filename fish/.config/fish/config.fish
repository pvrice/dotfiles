if status --is-interactive && which keychain > /dev/null 2>&1
    env SHELL=/usr/bin/fish keychain --agents gpg,ssh --eval --noask --quiet -Q id_rsa | source
end

set -gx fish_key_bindings fish_hybrid_key_bindings
set -gx fish_cursor_default     block
set -gx fish_cursor_insert      line
set -gx fish_cursor_replace_one underscore
