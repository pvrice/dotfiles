. ~/.zshenv

export KEYTIMEOUT=1

ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="jreese"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(archlinux autojump common-aliases git sudo systemd vi-mode history-substring-search)

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

source $HOME/bin/base16-harmonic16.dark.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/fzf/key-bindings.zsh
