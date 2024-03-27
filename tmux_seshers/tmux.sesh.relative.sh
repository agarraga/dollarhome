#!/bin/sh

sesh="relative"
win0="editing"

tmux new-session -s $sesh -c '~/repos/relativecpp' -n $win0 -d

tmux split-window -h -t $sesh:$win0
tmux resize-pane -x 86 -t $sesh:$win0.left
tmux send-keys -t $sesh:$win0.left 'nvim' C-m
tmux send-keys -t $sesh:$win0.right 'tree' C-m

tmux select-pane -t $sesh:$win0.left
tmux attach -t $sesh
