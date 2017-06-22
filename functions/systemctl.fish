function systemctl
  if isatty 1
    grc /usr/bin/systemctl $argv
  else
    /usr/bin/systemctl $argv
  end
end
