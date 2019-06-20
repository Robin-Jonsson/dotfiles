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
alias ls="ls --color=auto"

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

# == Variables == #
_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B '
local return_code="%(?..%{$fg[red]%} %? ↵%{$reset_color%})"

# == Colors == #
_black='%F{016}'
_lightblue='%F{111}'
_lightgreen='%F{108}'
_yellow='%F{154}'
_green='%F{064}'
_white='%F{255}'

# == Tabbing == #
zstyle ':completion:*' menu select

# == Prompt == #
# Bash colors
FG_WHITE="\e[38;5;255m"
FG_GRAY="\e[38;5;250m"
FG_LGREEN="\e[38;5;108m"
FG_LBLUE="\e[38;5;111m"
FG_RED="\e[38;5;196m"
FG_LRED="\e[38;5;203m"
FG_YELLOW="\e[38;5;226m"

# Zsh colors
ZF_WHITE="%F{255}"
ZF_GRAY="%F{250}"
ZF_LYELLOW="%F{228}"

precmd() {
    GIT_CMD=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    GIT_PROMPT=""
    if [[ -n $GIT_CMD ]]; then
        GIT_PROMPT+="${ZF_GRAY}[${FG_LGREEN}${GIT_CMD}"
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
        GIT_PROMPT+="${ZF_GRAY}]"
    fi
    REMOTE=`if [[ -n $SSH_CLIENT ]]; then; echo " $(echo $FG_YELLOW)[ SSH: $(echo $FG_RED)$(echo $SSH_CONNECTION | awk '{print $1}')$(echo $FG_YELLOW) ]"; fi`
}
PS1=$'$(echo $FG_GRAY)┌────$(echo $REMOTE) $(echo $FG_LGREEN)$(whoami)@$(hostname) $(echo $FG_GRAY)in $(echo $FG_LBLUE)$(dirs) $(echo $GIT_PROMPT)\n${ZF_GRAY}└ $ ${ZF_WHITE}'
RPS1="${return_code} ${ZF_GRAY}[${ZF_LYELLOW}%*${ZF_GRAY}]"


###   ZSH AUTO SUGGESTIONS   ###
# Load zsh-autosuggestions.
source $source_dir/zsh-autosuggestions/zsh-autosuggestions.zsh
