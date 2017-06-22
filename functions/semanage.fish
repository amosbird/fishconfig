function semanage
  if isatty 1
    grc /usr/sbin/semanage $argv
  else
    /usr/sbin/semanage $argv
  end
end
