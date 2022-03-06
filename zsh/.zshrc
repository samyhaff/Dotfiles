# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/samy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# prompt
# autoload -U promptinit
# promptinit
# prompt spaceship

# set default apps
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="alacritty"
export READER="zathura"
export PAGER="less"

# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# colors
autoload -U colors && colors
# PS1="%{$fg[blue]%}%~ %{$fg[red]%}$%b "
PS1="%B%{$fg[red]%}[%{$fg[white]%}%n%{$fg[blue]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

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
alias g=git
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias ls="exa --icons --group-directories-first"
alias slmake="rm config.h && make clean && sudo make clean install"
alias grep='grep --color=auto'
# alias sudo='doas'
alias v="nvim"
alias vim="nvim"
alias tree="tree -C"
alias ll="ls -l"
alias la="ls -la"
alias pacfind="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias parufind="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
alias status="git status"
alias branch="git branch"
alias checkout="git checkout"
alias clone="git clone"
alias fetch="git fetch"
alias pull="git pull origin"
alias push="git push origin"
alias addup="git add -u"
alias addall="git add ."
alias commit="git commit -m"
alias add="git add"

# custom functions
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

launch () {
    "$@" &
    disown
    exit
}

rapport () {
    mkdir rapport; mkdir rapport/images
    cd rapport
    cp $HOME/Notes/cours/DATASIM_TP/template.tex ./rapport.tex
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extende"

# (cat ~/.cache/wal/sequences &)

# fzf
export FZF_DEFAULT_OPTS='--border'

setopt autocd

# Navigation
fcd() {
    cd "$(fd --type d | fzf)"
}

alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Latex preamble TP DATASIM
export TEXINPUTS=".:~/Notes/cours/DATASIM_TP/packages:"

# pluggins
source ~/.config/lf/icons
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
