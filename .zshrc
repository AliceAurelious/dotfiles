# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile

HISTSIZE=10000000000000
SAVEHIST=10000000000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt autocd
setopt interactive_comments
setopt append_history inc_append_history share_history

bindkey "^[[3~" delete-char

alias q=exit
alias girl=man
alias iceon="docker-network prune"
alias neofetch=fastfetch
alias gvim="nvim --listen /tmp/godot.pipe"

eval "$(starship init zsh)"
export PATH="/home/awagner/.gdvm/bin/current_godot:/home/awagner/.gdvm/bin:$PATH"
