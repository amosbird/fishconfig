function ss
  if isatty 1
    grc /usr/sbin/ss $argv
  else
    /usr/sbin/ss $argv
  end
end
