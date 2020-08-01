################################################################################
# Requires extra/grml-zsh-config
################################################################################

# Aliases
alias vim="nvim"
alias -s R=vim
alias -s py=vim
alias -s txt=vim
alias -s log="less -MN"
alias vimdiff="nvim -d"
alias cat="highlight -l -O ansi --force"
alias wifi="nmcli d wifi list"
alias noise="play -n -q synth 2:0:0 brownnoise synth pinknoise mix synth sine amod 0 10 &"
alias halfnoise="play -n -q synth 1:0:0 brownnoise synth pinknoise mix synth sine amod 0 10 &"
alias solo="autorandr --load solo"
alias home="autorandr --load home"

# CSV quicklook
csv () {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

# Extraction Function
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvJf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *.xz)        unxz $1        ;;
      *.exe)       cabextract $1  ;;
      *)           echo "\`$1': unrecognized file compression" ;;
    esac
  else
    echo "\`$1' is not a valid file"
  fi
}

# 1password utils
opon() {
  if [[ -z $OP_SESSION_my ]]; then
    eval $(op signin my)
  fi
}

opoff() {
  op signout
  unset OP_SESSION_ny
}

opass() {
  opon
  op get item "$1" |jq -r '.details.fields[] |select(.designation=="password").value' | xclip -selection clipboard
  opoff
}

gcp () {
    git pull
    git add *.wiki
    git commit -m "update: `date +'%Y-%m-%d %H:%M:%S'`"
    git push
}

gc () {
    git pull
    git add *.wiki
    git commit -m "update: `date +'%Y-%m-%d %H:%M:%S'`"
}

# Default editor
export VISUAL=nvim # Preferred editor for local and remote sessions
export EDITOR=nvim # Preferred editor for local and remote sessions

# VIM GNUPG
export GPG_TTY=$(tty)
export GNUPGHOME="$HOME/.config/gnupg"

# PATH for Google Cloud SDK & completion
# source '/home/mt/google-cloud-sdk/path.zsh.inc'
# source '/home/mt/google-cloud-sdk/completion.zsh.inc'

# Welcome Screen
# neofetch --disable gpu --color_blocks off --gtk3 off

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

fpath+=~/.zfunc

# vi-mode
bindkey -v
