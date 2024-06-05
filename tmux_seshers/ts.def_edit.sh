#!/bin/sh

[[ $# -eq 1 && sesh=$PWD wd=$PWD ]]
[[ $# -eq 2 && sesh=$1 wd=$PWD ]]
[[ $# -eq 3 && sesh=$1 wd=$2 ]]

win0="edit"

tmux has-session -t$sesh 2>/dev/null

if [ $? -ne 0 ]; then
	tmux new-session -d -s$sesh -c$wd -n$win0
	tmux split-window -bh -c$wd -l86 -t$sesh:$win0
	tmux send-keys -t$sesh:$win0.left 'nvim' C-m Space 'ff'
	tmux send-keys -t$sesh:$win0.right 'tree -L 2' C-m
	tmux select-pane -t$sesh:$win0.left
fi

tmux attach-session -t$sesh
