function fish_user_key_bindings
  function updir
    cd ..
    commandline -f repaint
  end

  function myprevd
    prevd ^&1 > /dev/null
    commandline -f repaint
  end

  function mynextd
    nextd ^&1 > /dev/null
    commandline -f repaint
  end

  function fzf-jump-cd -d "Change directory"
    set -q FZF_ALT_C_COMMAND; or set -l FZF_ALT_C_COMMAND "
    command jump top"
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS"
      eval "$FZF_ALT_C_COMMAND | "(__fzfcmd)" +m" | read -l result
      [ "$result" ]; and cd $result
    end
    commandline -f repaint
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

  # Store last token in $dir as root for the 'find' command
  function fzf-file-widget -d "List files and folders"
    set -l dir (commandline -t)
    # The commandline token might be escaped, we need to unescape it.
    set dir (eval "printf '%s' $dir")
    if [ ! -d "$dir" ]
      set dir .
    end
    # Some 'find' versions print undesired duplicated slashes if the path ends with slashes.
    set dir (string replace --regex '(.)/+$' '$1' "$dir")

    # "-path \$dir'*/\\.*'" matches hidden files/folders inside $dir but not
    # $dir itself, even if hidden.
    set -q FZF_CTRL_T_COMMAND; or set -l FZF_CTRL_T_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 's#^\./##'"

    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS"
      eval "$FZF_CTRL_T_COMMAND | "(__fzfcmd)" -m" | while read -l r; set result $result $r; end
    end
    if [ -z "$result" ]
      commandline -f repaint
      return
    end

    if [ "$dir" != . ]
      # Remove last token from commandline.
      commandline -t ""
    end
    for i in $result
      commandline -it -- (string escape $i)
      commandline -it -- ' '
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
        builtin history token -n 1000 | eval (__fzfcmd) -- -q '$tok' | read -l result
        and commandline -tr -- $result
      end
    end
    commandline -f repaint
  end

  # TODO: wait bfs gets 1.0 to add fstype flags
  # set -q FZF_ALT_C_COMMAND; or set -l FZF_ALT_C_COMMAND "
  # command $cmd -L . \\( -path '*/\\.*' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
  # -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
  function fzf-cd-widget -d "Change directory"
    if type -q bfs
      set cmd bfs
    else
      set cmd find
    end
    set -q FZF_ALT_C_COMMAND; or set -l FZF_ALT_C_COMMAND "
    command $cmd -L . \\( -path '*/\\.*' \\) -prune \
    -o -type d -print 2> /dev/null | sed 1d | cut -b3-"
    set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS"
      eval "$FZF_ALT_C_COMMAND | "(__fzfcmd)" +m" | read -l result
      [ "$result" ]; and cd $result
    end
    commandline -f repaint
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
      commandline -r "sudo $history[1]"
      commandline -f execute
    end
  end

  function open-magit -d "Open magit in emacs"
    if emacsclient -n -eval "(magit-status $pwd)" ^&1 > /dev/null
      tmux switch-client -t emacs
    end
  end

  bind \ep updir
  bind \cs last-sudo
  bind \cr fzf-history-token-widget
  bind \ec fzf-cd-widget
  bind \eg fzf-jump-cd
  bind \eo myprevd
  bind \ei mynextd
  bind \em fzf-command-go
  bind \ci fzf-complete
  bind \cg open-magit
end
