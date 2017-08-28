alias startscribble='systemctl --user start mpdscribble'
alias stopscribble='systemctl --user stop mpdscribble'
if which exa ^ /dev/null > /dev/null
  alias la='exa -laF'
  alias ll='exa -lF'
end
