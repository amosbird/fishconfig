function fish_user_key_bindings
  function updir
    cd ..
    commandline -f repaint
    eval (direnv export fish);
  end

  function myprevd
    prevd ^&1 > /dev/null
    commandline -f repaint
    eval (direnv export fish);
  end

  function mynextd
    nextd ^&1 > /dev/null
    commandline -f repaint
    eval (direnv export fish);
 end

  function fzf-jump-cd -d "Change directory"
    set -q FZF_ALT_C_COMMAND; or set -l FZF_ALT_C_COMMAND "command jump top"
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS"
      eval "$FZF_ALT_C_COMMAND | "(__fzfcmd)" +m" | read -l result
      [ "$result" ]
      and if not cd $result
        jump clean
      end
    end
    commandline -f repaint
    eval (direnv export fish);
  end

  function fzf-complete -d 'fzf completion and print selection back to commandline'
      set -l complist (complete -C(commandline -c))
      set -l result
      string join -- \n $complist | sort | eval (__fzfcmd) -m --tiebreak=index --select-1 --exit-0 --header '(commandline)' | cut -f1 | while read -l r; set result $result $r; end

      for i in (seq (count $result))
          set -l r $result[$i]
          ## We need to escape the result.
          switch (string sub -s 1 -l 1 -- (commandline -t))
              case "'"
                  commandline -t -- (string escape -- (eval "printf '%s' '$r'"))
              case '"'
                  set -l quoted (string escape -- (eval "printf '%s' '$r'"))
                  set -l len (string length $quoted)
                  commandline -t -- '"'(string sub -s 2 -l (math $len - 2) (string escape -- (eval "printf '%s' '$r'")))'"'
              case '~'
                  commandline -t -- (string sub -s 2 (string escape -n -- (eval "printf '%s' '$r'")))
              case '*'
                  commandline -t -- (string escape -n -- (eval "printf '%s' '$r'"))
          end
          [ $i -lt (count $result) ]; and commandline -i ' '
      end

      commandline -f repaint
  end

  function fzf-history-widget -d "Show command history"
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS +s --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m"
      history | eval (__fzfcmd) -q '(commandline)' | read -l result
      and commandline -- $result
    end
    commandline -f repaint
  end

  function fzf-history-token-widget -d "Show command history"
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    set str (commandline -jc)
    set tok (commandline -tc)
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS +s --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m"
      if [ $str = $tok ]
        history | eval (__fzfcmd) -q '$str' | read -l result
        and commandline -- $result
      else
        string tokenize -n 1000 -a | eval (__fzfcmd) -q '$tok' | read -l result
        and commandline -tr -- $result
      end
    end
    commandline -f repaint
  end

  function fzf-cd-widget -d "Change directory"
    if type -q bfs
      set cmd bfs
    else
      set cmd find
    end
    set -q FZF_ALT_C_COMMAND; or set -l FZF_ALT_C_COMMAND "
    command $cmd -L . \\( -path '*/\\.*' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
    # command $cmd -L -type d -print 2> /dev/null | sed 1d | cut -b3-"
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS"
      eval "$FZF_ALT_C_COMMAND | "(__fzfcmd)" +m" | read -l result
      [ "$result" ]; and cd $result
    end
    commandline -f repaint
    eval (direnv export fish);
  end

  function __fzfcmd
    set -q FZF_TMUX; or set FZF_TMUX 0
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    if [ $FZF_TMUX -eq 1 ]
      echo "fzf-tmux -d$FZF_TMUX_HEIGHT"
    else
      echo "fzf"
    end
  end

  function fzf-command-go -d "Execute current command line and filter results by fzf"
    set -q FZF_TMUX; or set FZF_TMUX 0
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    if [ $FZF_TMUX -eq 1 ]
      commandline -aj " ^&1 | fzf-tmux -d$FZF_TMUX_HEIGHT"
    else
      commandline -aj " ^&1 | fzf"
    end
    commandline -f execute
  end

  # TODO: prompt new line?
  function last-sudo -d "Execute last command using sudo if current commandline is blank"
    if string match -r '^ *$' (commandline)
      commandline -a "sudo $history[1]"
      commandline -f execute
    end
  end

  function open-magit -d "Open magit in emacs"
    if emacsclient -n -eval "(magit-status $pwd)" ^&1 > /dev/null
      tmux switch-client -t emacs
    end
  end

  function open-ranger -d "Open ranger in emacs"
    if emacsclient -n -eval "(ranger $pwd)" ^&1 > /dev/null
      tmux switch-client -t emacs
    end
  end

  function fish_clipboard_copy
    set esc "\033]52;c;"(printf (commandline) | head -c 100000 | base64 | tr -d '\r\n')"\a"
    if count $TMUX > /dev/null
      set esc "\033Ptmux;\033"$esc"\033\\" # tmux
    end
    printf "$esc"
  end

  function pet-select
    set -l query (commandline)
    pet search --query "$query" $argv | read cmd
    commandline $cmd
  end

  bind \ep updir
  bind \cs last-sudo
  bind \cj 'commandline "sudo "(commandline); commandline -f execute'
  bind \cr fzf-history-token-widget
  bind \ec fzf-cd-widget
  bind \eg fzf-jump-cd
  bind \eo myprevd
  bind \ei mynextd
  bind \el pet-select
  bind \em fzf-command-go
  bind \ci fzf-complete
  bind \cg open-magit
  bind \er open-ranger

  # tmux

  function select-window --argument-names "n"
    tmux select-window -t $n > /dev/null ^&1
  end

  function select-pane --argument-names "o"
    tmux select-pane $o  > /dev/null ^&1
  end

  bind \e1 'select-window 1'
  bind \e2 'select-window 2'
  bind \e3 'select-window 3'
  bind \e4 'select-window 4'
  bind \e5 'select-window 5'
  bind \e6 'select-window 6'
  bind \e7 'select-window 7'
  bind \e8 'select-window 8'
  bind \e9 'select-window 9'
  bind \e0 'select-window 10'

  bind \eh 'select-pane -L'
  bind \ej 'select-pane -D'
  bind \ek 'select-pane -U'
  bind \el 'select-pane -R'

  bind \ev 'tmux copy-mode -u'
  bind \cx1 'tmux resize-pane -Z'
  bind \cx2 'tmux split-window -v -c "#{pane_current_path}"'
  bind \cx3 'tmux split-window -h -c "#{pane_current_path}"'
  bind \cxs 'tmux set synchronize-panes'
  bind \cx\cc 'tmux detach-client'
  bind \cxr 'tmux source-file ~/.tmux/.tmux.conf.amos \; tmux display "~/.tmux/.tmux.conf.amos sourced"'
end
