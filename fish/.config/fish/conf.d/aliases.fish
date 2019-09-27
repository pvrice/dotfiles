alias fzf 'fzf --bind=ctrl-j:accept,ctrl-k:kill-line'
alias fzf-tmux 'fzf-tmux --bind=ctrl-j:accept,ctrl-k:kill-line'
alias pass 'env EDITOR=nvim_nowrite pass'
alias transmission-remote 'env TR_AUTH=$USER:(pass show transmission | head -1) transmission-remote -ne'
alias neomutt 'neomutt -e "source mutt_pass|"'

if which exa > /dev/null 2>&1
    alias ls 'exa'
    alias la 'exa -la'
    alias ll 'exa -l'
    alias tree 'exa -T'
end
