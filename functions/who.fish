function who
  if isatty 1
    grc /usr/bin/who $argv
  else
    /usr/bin/who $argv
  end
end
