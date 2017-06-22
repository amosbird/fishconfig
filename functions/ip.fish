function ip
  if isatty 1
    grc /usr/sbin/ip $argv
  else
    /usr/sbin/ip $argv
  end
end
