# Put your user-specified config here.
source "$XDG_CONFIG_HOME/shell/aliasrc"
source "$XDG_CONFIG_HOME/zsh.d/myfunc.zsh"

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# vi-mode using plugin
KEYTIMEOUT=15
VI_MODE_SET_CURSOR=true
