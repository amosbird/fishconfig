function netstat
  if isatty 1
    grc /usr/bin/netstat $argv
  else
    /usr/bin/netstat $argv
  end
end
