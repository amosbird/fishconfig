function ping
  if isatty 1
    grc /usr/bin/ping $argv
  else
    /usr/bin/ping $argv
  end
end
