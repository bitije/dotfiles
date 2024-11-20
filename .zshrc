# Auto startx
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#     exec startx
# fi

export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/w/bin:$PATH
export VISUAL=nvim
export EDITOR="$VISUAL"
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN

# export .env file
[ -f "$HOME/.env" ] && source "$HOME/.env"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias q="tmux attach"
alias v="nvim"
alias ccc="clipmenu"
alias chtsh="less /home/w/cht.sh"
alias vpn="$HOME/bin/Outline-Client.AppImage"
alias mtt="echo $MTT_PASS | sudo openconnect --protocol=anyconnect --passwd-on-stdin --user FSomov@office.msk.mtt --authgroup=MTT_RemoteAccess vpn.mtt.ru"

# find in files
ff () { find $HOME | fzf | xargs -r -I % $EDITOR % ; }

# start tmux session for project
fj () {
    selected_file=$( find $HOME/dev/ -type d | fzf )
    if [ -n "$selected_file" ]; then
        cd $selected_file
        session_name=$(basename "$selected_file")
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
nn () {
    cd $HOME/obsidian-vault
    $EDITOR $HOME/obsidian-vault/1-main.md
    cd $OLDPWD
}

# git sync notes
sync-notes () {
    cd $HOME/obsidian-vault
    git add . && git commit -m "sync-notes" && git push
    cd $OLDPWD
}
