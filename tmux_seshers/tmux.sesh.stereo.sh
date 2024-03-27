#!/bin/sh

sesh="stereo"
win0="library|player"

tmux new-session -s $sesh -c '~/Desktop' -n $win0 -d

tmux split-window -h -t $sesh:$win0
tmux resize-pane -x 64 -t $sesh:$win0.right
tmux send-keys -t $sesh:$win0.left 'cd music-limbo; tree' C-m
tmux send-keys -t $sesh:$win0.right 'cmus' C-m

tmux select-pane -t $sesh:$win0.right
tmux attach -t $sesh
