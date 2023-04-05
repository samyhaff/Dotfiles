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
alias ls="exa --icons --group-directories-first"
alias grep='grep --color=auto'
alias v="nvim"
alias vim="nvim"
alias tree="tree -C"
alias ll="ls -l"
alias la="ls -la"

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

# pluggins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(/opt/homebrew/bin/brew shellenv)
