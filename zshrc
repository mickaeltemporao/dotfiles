
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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# pyenv Configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
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

# CSV quicklook
function csv {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

# Startup display
neofetch

