function ifconfig
  if isatty 1
    grc /usr/sbin/ifconfig $argv
  else
    /usr/sbin/ifconfig $argv
  end
end
