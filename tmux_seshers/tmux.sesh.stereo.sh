#!/bin/sh

sesh="stereo"
win0="library|player"
wd="~/Desktop"

tmux new-session -s $sesh -c $wd -n $win0 -d

tmux split-window -h -t $sesh:$win0
tmux resize-pane -x 64 -t $sesh:$win0.right
tmux send-keys -t $sesh:$win0.left "cd $wd; tree -L 2" C-m
tmux send-keys -t $sesh:$win0.right "cd $wd; cmus" C-m

tmux select-pane -t $sesh:$win0.right
tmux attach -t $sesh

# The `-c $wd' in new session doesn't seem to work????
