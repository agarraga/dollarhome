#!/bin/sh

sesh="relative"
win0="editing"
wd="~/repos/relativecpp"

tmux has-session -t$sesh 2>/dev/null

if [ $? -ne 0 ]; then
	tmux new-session -s$sesh -c$wd -n$win0 -d
	tmux split-window -h -t$sesh:$win0
	tmux resize-pane -x86 -t$sesh:$win0.left
	tmux send-keys -t$sesh:$win0.left "cd $wd; nvim" C-m
	tmux send-keys -t$sesh:$win0.right "cd $wd; tree" C-m
	tmux select-pane -t$sesh:$win0.left
fi

tmux attach-session -t$sesh
