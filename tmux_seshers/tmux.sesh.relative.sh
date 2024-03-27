#!/bin/sh

sesh="relative"
win0="editing"
wd="~/repos/relativecpp"

tmux new-session -s $sesh -c $wd -n $win0 -d

tmux split-window -h -t $sesh:$win0
tmux resize-pane -x 86 -t $sesh:$win0.left
tmux send-keys -t $sesh:$win0.left "cd $wd; nvim" C-m
tmux send-keys -t $sesh:$win0.right "cd $wd; tree" C-m

tmux select-pane -t $sesh:$win0.left
tmux attach-session -t $sesh
