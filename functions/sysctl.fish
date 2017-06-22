function sysctl
  if isatty 1
    grc /usr/sbin/sysctl $argv
  else
    /usr/sbin/sysctl $argv
  end
end
