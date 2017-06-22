function diff
  if isatty 1
    grc /usr/bin/diff $argv
  else
    /usr/bin/diff $argv
  end
end
