#!/bin/sh

sesh="0x0a"
win0="time"
win1="dashboard"
win2="mail"

tmux has-session -t$sesh 2>/dev/null

if [ $? -ne 0 ]; then
	tmux new-session -s $sesh -n $win0 -d
	tmux split-window -h -t $sesh:$win0
	tmux split-window -v -t $sesh:$win0.left
	tmux send-keys -t $sesh:$win0.right 'calcurse' C-m
	tmux clock-mode -t $sesh:$win0.bottom-left
	tmux select-pane -t $sesh:$win0.right
	tmux new-window -t $sesh -n $win1
	tmux send-keys -t $sesh:$win1 'btop' C-m
	tmux new-window -t $sesh -n $win2
	tmux send-keys -t $sesh:$win2 'mutt' C-m
	tmux select-window -t $sesh:$win0
fi

tmux attach -t $sesh
