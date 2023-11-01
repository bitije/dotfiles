# Auto startx
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

usb() {
    udiskie -q -N &
    udiskie_pid=$!
    ranger /run/media/
    if [ -n "$udiskie_pid" ]; then
        kill "$udiskie_pid"
        unset udiskie_pid
    fi
}

alias q="tmux attach"

export VISUAL=nvim
export EDITOR="$VISUAL"

ff () { fzf | xargs -r -I % $EDITOR % ; }
