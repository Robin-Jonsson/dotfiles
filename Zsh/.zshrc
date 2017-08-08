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
bindkey -s "^L" '^Uclear\n'

# == Aliases == #
alias vim="nvim"
if tmux-next -V &> /dev/null; then
    alias tmux="tmux-next"
fi

# == Tmux == #
if [[ -z "$TMUX" ]]; then
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

# == Git == #
# Load git plugin
source $source_dir/.zsh/zsh-git-prompt/git-prompt.zsh


# == Tabbing == #
zstyle ':completion:*' menu select

# == Prompt == #
# Bash colors
FG_WHITE="\e[38;5;255m"
FG_GRAY="\e[38;5;250m"
FG_LGREEN="\e[38;5;108m"
FG_LBLUE="\e[38;5;111m"
FG_LRED="\e[38;5;203m"

# Zsh colors
ZF_WHITE="%F{255}"
ZF_GRAY="%F{250}"
ZF_LYELLOW="%F{228}"

precmd() {
    GIT_PROMPT=`git_prompt_precmd`
    LEFT="$(echo $FG_GRAY)┌──── $(echo $FG_LGREEN)$(whoami)@$(hostname) $(echo $FG_GRAY)in $(echo $FG_LBLUE)$(dirs)/ $(echo $GIT_PROMPT)"
    print $LEFT
}
PS1="${ZF_GRAY}└ $ ${ZF_WHITE}"
RPS1="${return_code} ${ZF_GRAY}[${ZF_LYELLOW}%*${ZF_GRAY}]"


###   ZSH AUTO SUGGESTIONS   ###
# Load zsh-autosuggestions.
source $source_dir/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
