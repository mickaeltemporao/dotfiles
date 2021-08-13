# Default programs:

export BROWSER="qutebrowser"
export EDITOR="nvim"
export MYVIMRC="$HOME/.config/nvim/init.vim"
export TERMINAL="st"
export VISUAL="nvim"

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Auto startx
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

