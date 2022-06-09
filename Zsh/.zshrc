# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/robin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

# History
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

# Source dir
source_dir="$(dirname "$0")"

### AUTOLOADS   ###
autoload -U compinit && compinit


###   EXPORTS   ###
export TERM=xterm-256color
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$HOME/.bin


### USAGE   ###
# == Bindkeys == #
bindkey '^W' vi-backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey '^[[Z' reverse-menu-complete

# == Aliases == #
alias vim="nvim"
if tmux-next -V &> /dev/null; then
    alias tmux="tmux-next"
fi
alias ls="ls --color=auto -h"
alias ll="ls -alF"

# == Tmux == #
if [[ -z "$TMUX" ]] && [[ -z "$SSH_CLIENT" ]]; then
    if tmux-next -V &> /dev/null; then
        exec tmux-next
    else;
        exec tmux
    fi
fi

# == ZStyle == #
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


###   STYLING   ###
# == Preloads == #
autoload -U colors && colors
setopt prompt_subst

# == Colors == #
source $source_dir/color-robdark.zsh

# == Variables == #
local return_code="%(?..${ACCENT} %? ↵%{$reset_color%})"

# == Tabbing == #
zstyle ':completion:*' menu select

# == Prompt == #
precmd() {
    GIT_CMD=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    GIT_PROMPT=""
    if [[ -n $GIT_CMD ]]; then
        GIT_PROMPT+="${FG0}[${ACCENT}${GIT_CMD}"
        if [[ -n $(git diff --name-only) ]]; then
            GIT_PROMPT+="*"
        fi
        if [[ -n $(git diff --staged --name-only) ]]; then
            GIT_PROMPT+="&"
        fi
        if [[ -n $(git rev-list origin..HEAD) ]]; then
            GIT_PROMPT+="©"
        fi
        if [[ -n $(git rev-list HEAD..origin) ]]; then
            GIT_PROMPT+="®"
        fi
        GIT_PROMPT+="${FG0}]"
    fi
    REMOTE=`if [[ -n $SSH_CLIENT ]]; then; echo " $(echo $GOLD)[ SSH: $(echo $ACCENT)$(echo $SSH_CONNECTION | awk '{print $1}')$(echo $GOLD) ]"; fi`
}
PS1=$'$(echo $FG0)┌────$(echo $REMOTE) $(echo $ACCENT)$(whoami)@$(hostname) $(echo $FG0)in $(echo $FG1)$(dirs) $(echo $GIT_PROMPT)\n${FG0}└ $ %{$reset_color%}'
RPS1="${return_code} ${FG0}[${GOLD}%*${FG0}]"


###   ZSH AUTO SUGGESTIONS   ###
# Load zsh-autosuggestions.
source $source_dir/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
source $source_dir/fzf-key-bindings.zsh
