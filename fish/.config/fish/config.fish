alias startscribble='systemctl --user start mpdscribble'
alias stopscribble='systemctl --user stop mpdscribble'

# relies on $SHELL being /usr/bin/fish
if status --is-interactive
  keychain --eval --quiet --noask -Q id_rsa | source
end

if which exa ^ /dev/null > /dev/null
  alias la='exa -laF'
  alias ll='exa -lF'
end
