function dig
  if isatty 1
    grc /usr/bin/dig $argv
  else
    /usr/bin/dig $argv
  end
end
