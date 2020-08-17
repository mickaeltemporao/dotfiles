# Default programs:

export BROWSER="qutebrowser"
export EDITOR="nvim"
export MYVIMRC="$HOME/.config/nvim/init.vim"
export TERMINAL="alacritty"
export VISUAL="nvim"

# Auto startx
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
