# ZSH plugins init
fpath=(/opt/homebrew/share/zsh-completions $fpath)

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-you-should-use/you-should-use.plugin.zsh

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2
