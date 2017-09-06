function tmuxgdb -d ""
  tmux neww -n Debug
  tmux splitw -h -p 50
  tmux select-pane -t 1
  set tty1 (tmux display -p "#{pane_tty}")
  tmux splitw -v -p 40
  set tty3 (tmux display -p "#{pane_tty}")
  tmux select-pane -t 1
  tmux splitw -v -p 40
  set tty2 (tmux display -p "#{pane_tty}")
  # tmux send-keys "reptyr -l" C-m
  tmux send-keys "sleep infinity" C-m
  tmux select-pane -t 4
  tmux send-keys "cgdb -- $argv -tty $tty2 -ex \"dashboard stack -output $tty1\" -ex \"dashboard expression -output $tty3\"" C-m
end
