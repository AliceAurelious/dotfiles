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

#nvim foo to have vim in the embeded terminal of nvim as the default editor
if ! [ -z "$NVIM" ]; then
	export EDITOR="vim"
else
	if ! command -v nvim &> /dev/null; then
		export EDITOR ="vim"
	else
		export EDITOR="nvim"
	fi
fi

#Keybinds
bindkey "^[[3~" delete-char				# make the del key work	
bindkey "^[[1;5C" forward-word		# Ctrl + -> moves forward one word
bindkey "^[[1;5D" backward-word		# Ctrl + <- moves back one word

#Auto compleation
autoload -U compinit; compinit

#Aliases
alias q=exit																# used to that from vin/nvim
alias :q=exit																# 					"
alias girl=man															# girls just wanna have fun
alias ICE_ON="docker-network prune"					# disable all container network in case I am on an ICE train so I can use the train Wifi
alias neofetch=fastfetch										# just for muscle memories sake
alias gvim="nvim --listen /tmp/godot.pipe"	# Godot and Nvim 🤝
alias cd=z																	# Zoxide

#ls stuff
alias ls="ls --color=auto"
alias lsa="ls -a"
alias lsla="ls -la"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--border bold --border rounded --color dark --layout reverse --height 15"

#starship for fancy CLI propmt
eval "$(starship init zsh)"

#Zoxide for nicer nvigation
eval "$(zoxide init zsh)"
