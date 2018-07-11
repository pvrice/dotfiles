alias fzf 'fzf --bind=ctrl-j:accept,ctrl-k:kill-line'
alias fzf-tmux 'fzf-tmux --bind=ctrl-j:accept,ctrl-k:kill-line'
alias pass 'env EDITOR=nvim_nowrite pass'
alias transmission-remote 'transmission-remote -n $USER:(pass show transmission | head -1)'

if which exa > /dev/null 2>&1
    alias ls 'exa'
    alias la 'exa -laF'
    alias ll 'exa -lF'
    alias tree 'exa -T'
end
