# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
zstyle :compinstall filename '/home/samy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# prompt
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats 'on %b '
precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='%B%F{cyan}%~ %f%F{%(?.green.red)}λ%b %F{yellow}${vcs_info_msg_0_}%f'

# completion
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Aliases
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias ls="lsd --icon always --group-directories-first"
alias grep='grep --color=auto'
alias v="nvim"
alias vim="nvim"
alias tree="tree -C"
alias ll="ls -l"
alias la="ls -la"

export PATH=$PATH:$HOME/.local/bin

# custom functions
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# fzf
setopt autocd

fcd() {
    cd "$(fd --type d | fzf)"
}

fopen() {
    open "$(fd --type f | fzf)"
}

############### Phd stuff ################

zopen() {
    file=$(fd --type f . ~/Zotero/storage | fzf)
    if [ -n "$file" ]; then
        open "$file"
    fi
}

zcp() {
    dir="$1"
    file=$(fd --type f . ~/Zotero/storage | fzf)
    if [ -n "$file" ]; then
        cp "$file" "$dir"
    fi
}

sshg() {
    gpu_number="$1"
    ssh shaffoudhi@gpu"$1".enst.fr
}

sshl() {
    ssh shaffoudhi@lame"$1".enst.fr
}

gpustats() {
    for X in {1..9}; do
        echo "Checking gpu${X}.enst.fr..."
        timeout 10s ssh -o ConnectTimeout=5 "shaffoudhi@gpu${X}.enst.fr" \
            nvidia-smi --query-gpu=index,memory.used,memory.total --format=csv,noheader,nounits 2>/dev/null |
        if [[ $? -eq 0 ]]; then
            echo "Memory usage on gpu${X}.enst.fr:"
            while IFS=',' read -r INDEX USED TOTAL; do
                echo "  GPU ${INDEX}: ${USED}MiB / ${TOTAL}MiB"
            done
        else
            echo "Could not connect to gpu${X}.enst.fr."
        fi
        echo "-----------------------------------"
    done
}

##########################################

# pluggins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/samy/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/samy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/samy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/samy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
