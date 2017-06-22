function lsmod
  if isatty 1
    grc /usr/sbin/lsmod $argv
  else
    /usr/sbin/lsmod $argv
  end
end
