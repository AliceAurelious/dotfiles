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
setopt nonomatch # make wildcard work like in bash

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

#~/cowsay.sh

#Keybinds
bindkey "^[[3~" delete-char									# make the del key work	
bindkey "^[[1;5C" forward-word							# Ctrl + -> moves forward one word
bindkey "^[[1;5D" backward-word							# Ctrl + <- moves back one word

#the followint were copied from romkatv in this reddit thread https://www.reddit.com/r/zsh/comments/eblqvq/del_pgup_and_pgdown_input_in_terminal/
# If NumLock is off, translate keys to make them appear the same as with NumLock on.
bindkey -s '^[OM' '^M'  # enter
bindkey -s '^[Ok' '+'
bindkey -s '^[Om' '-'
bindkey -s '^[Oj' '*'
bindkey -s '^[Oo' '/'
bindkey -s '^[OX' '='

# If someone switches our terminal to application mode (smkx), translate keys to make
# them appear the same as in raw mode (rmkx).
bindkey -s '^[OH' '^[[H'  # home
bindkey -s '^[OF' '^[[F'  # end
bindkey -s '^[OA' '^[[A'  # up
bindkey -s '^[OB' '^[[B'  # down
bindkey -s '^[OD' '^[[D'  # left
bindkey -s '^[OC' '^[[C'  # right

# TTY sends different key codes. Translate them to regular.
bindkey -s '^[[1~' '^[[H'  # home
bindkey -s '^[[4~' '^[[F'  # end

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^?'      backward-delete-char          # bs         delete one char backward
bindkey '^[[3~'   delete-char                   # delete     delete one char forward
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
bindkey '^J'      backward-kill-line            # ctrl+j     delete everything before cursor
bindkey '^[[D'    backward-char                 # left       move cursor one char backward
bindkey '^[[C'    forward-char                  # right      move cursor one char forward
bindkey '^[[A'    up-line-or-beginning-search   # up         prev command in history
bindkey '^[[B'    down-line-or-beginning-search # down       next command in history

#Auto compleation
autoload -U compinit; compinit

#Aliases
alias q=exit																# used to that from vin/nvim
alias :q=exit																#							"
alias girl=man															# girls just wanna have fun
alias ICE_ON="docker-network prune"					# disable all container network in case I am on an ICE train so I can use the train Wifi
alias neofetch=fastfetch										# just for muscle memories sake

#nvim
alias vim=nvim
alias gvim="nvim --listen /tmp/godot.pipe"	# Godot and Nvim 🤝

#ls stuff
alias ls="ls --color=auto --classify"
alias lsa="ls -a"
alias lsla="ls -la"

#Git stuff
alias "gitlog"='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'

#asdf version manager
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
#asdf shell compleation
mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--border bold --border rounded --color dark --layout reverse --height 15"

#starship for fancy CLI propmt
eval "$(starship init zsh)"

#Zoxide for nicer nvigation
if command -v zoxide &> /dev/null; then
	eval "$(zoxide init zsh)"
	alias cd=z
fi
