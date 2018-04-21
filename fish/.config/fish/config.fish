alias startscribble='systemctl --user start mpdscribble'
alias stopscribble='systemctl --user stop mpdscribble'
alias fzf='fzf --bind=ctrl-j:accept,ctrl-k:kill-line'
alias fzf-tmux='fzf-tmux --bind=ctrl-j:accept,ctrl-k:kill-line'
alias transmission-remote 'transmission-remote -n $USER:(pass show transmission | head -1)'

if status --is-interactive
    env SHELL=/usr/bin/fish keychain --eval --quiet --noask -Q id_rsa | source
end

if which exa > /dev/null 2>&1
    alias la='exa -laF'
    alias ll='exa -lF'
end
