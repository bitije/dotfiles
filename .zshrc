# Auto startx
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/w/bin:$PATH
export VISUAL=nvim
export EDITOR="$VISUAL"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias q="tmux attach"
alias v="nvim"
alias ccc="clipmenu"
alias chtsh="less /home/w/cht.sh"
alias vpn="$HOME/bin/Outline-Client.AppImage"

# find in files
ff () { find $HOME | fzf | xargs -r -I % $EDITOR % ; }

# start tmux session for project
fj () {
    selected_file=$( find $HOME/dev/ -type f | fzf )
    if [ -n "$selected_file" ]; then
        cd $(dirname $selected_file)
        session_name=$(basename "$(dirname "$selected_file")")
        tmux new-session -d -s "$session_name" 
        tmux send-keys -t "$session_name:0" "$EDITOR $selected_file" C-m
        tmux split-window -h -t "$session_name:0"
        tmux resize-pane -t "$session_name:0" -R 30
        cd $OLDPWD
        tmux attach-session -t "$session_name"
    else
        echo "No file selected."
    fi
}

# tmux in current dir
tt () { tmux new-session -c $(pwd) }

# my notes
notes_session="notes"
nn () {
    if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
        echo "Not in a tmux session."
    elif tmux has-session -t $notes_session; then
        tmux attach -t $notes_session
    else
        tmux new-session -s $notes_session -c $HOME/obsidian-vault/ $EDITOR $HOME/obsidian-vault/1-main.md
    fi
}

# git sync notes
sync-notes () {
    cd $HOME/obsidian-vault && git add . && git commit -m "sync-notes" && git push
    cd $OLDPWD
}
