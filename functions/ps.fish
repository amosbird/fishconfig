function ps
  if isatty 1
    grc /usr/bin/ps $argv
  else
    /usr/bin/ps $argv
  end
end
