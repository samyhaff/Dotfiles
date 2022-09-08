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
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
# alias ls="exa --icons --group-directories-first"
alias slmake="rm config.h ; make clean && sudo make clean install"
alias grep='grep --color=auto'
# alias sudo='doas'
alias v="nvim"
alias vim="nvim"
alias tree="tree -C"
alias ll="ls -l"
alias la="ls -la"
alias pacfind="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias parufind="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"

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

# rapport () {
#     mkdir rapport; mkdir rapport/images
#     cd rapport
#     cp $HOME/notes/cours/DATASIM_TP/template.tex ./rapport.tex
# }

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

nnn_cd()
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi
}

trap nnn_cd EXIT

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extende"

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
export TEXINPUTS=".:~/notes/cours/ei2/DATASIM_TP/packages:"

# pluggins
# source ~/.config/lf/icons
source ~/.config/nnn/config
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# opam configuration
[[ ! -r /home/samy/.opam/opam-init/init.zsh ]] || source /home/samy/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
