# The following lines were added by compinstall
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/mt/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install


# Autostart X at login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi


# Default web browser
if [ -n "$DISPLAY" ]; then
    export BROWSER=google-chrome-stable
else
    export BROWSER=w3m
fi

# Default visual editor
export VISUAL=nvim

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Aliases
[ -f .aliases ] && source .aliases
alias -s R=vim
alias -s log="less -MN"
alias -s py=vim
alias -s txt=vim
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias psd="python setup.py develop"
alias psh="pipenv shell"
alias vim='nvim'
alias vimdiff='nvim -d'
alias ccat='highlight -l -O ansi --force'
alias wifi='nmcli d wifi list'

# CSV quicklook
function csv {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

# pyenv Configuration (Needs to be at the end of the file)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# The next line updates PATH for the Google Cloud SDK.
source /opt/google-cloud-sdk/path.zsh.inc
# The next line enables zsh completion for gcloud.
source /opt/google-cloud-sdk/completion.zsh.inc

# Copy-paste Clipboard ZSH VI-Mode
vi-append-x-selection () { RBUFFER=$(xsel -o -p </dev/null)$RBUFFER; }
zle -N vi-append-x-selection
bindkey -a '^X' vi-append-x-selection
vi-yank-x-selection () { print -rn -- $CUTBUFFER | xsel -i -p; }
zle -N vi-yank-x-selection
bindkey -a '^Y' vi-yank-x-selection
eval "$(pyenv virtualenv-init -)"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /home/mt/.pyenv/versions/3.8.0/bin/virtualenvwrapper.sh

# Modify path for Python's poetry dependency management system
export PATH="$HOME/.poetry/bin:$PATH"

# Welcome Screen
screenfetch -t

# VIM GNUPG
export GPG_TTY="tty"
export GNUPGHOME="$HOME/.config/gnupg"

