function uptime
  if isatty 1
    grc /usr/bin/uptime $argv
  else
    /usr/bin/uptime $argv
  end
end
