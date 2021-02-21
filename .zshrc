################################################################################
# Requires extra/grml-zsh-config
################################################################################

# Aliases
alias vifm="~/.config/vifm/scripts/vifmrun ."
alias vim="nvim"
alias -s R=vim
alias -s py=vim
alias -s txt=vim
alias -s log="less -MN"
alias R="radian"
alias vimdiff="nvim -d"
alias cat="highlight -l -O ansi --force"
alias noise="play -n -q synth 2:0:0 brownnoise synth pinknoise mix synth sine amod 0 10 &"
alias cours="cd ~/Documents/scpobx/cours"

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

gitup () {
    git pull
    git add *.html *.Rmd docs/
    git commit -m "website update on `date +'%Y-%m-%d %H:%M:%S'`"
    git push
}


# VIM GNUPG
export GPG_TTY=$(tty)
# export GNUPGHOME="$HOME/.config/gnupg"

# vi-mode config
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# TODO:
fpath+=~/.zfunc

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Preserve R libraries accros sessions
export R_LIBS_USER=/home/mt/Templates/r-libs

# Google utils
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mt/Templates/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mt/Templates/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mt/Templates/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mt/Templates/google-cloud-sdk/completion.zsh.inc'; fi

# Welcome Screen
pfetch

# Load syntax highlighting; should be last.
# Requires: https://github.com/zdharma/fast-syntax-highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

