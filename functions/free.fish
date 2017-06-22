function free
  if isatty 1
    grc /usr/bin/free $argv
  else
    /usr/bin/free $argv
  end
end
