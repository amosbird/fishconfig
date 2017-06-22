function docker
  if isatty 1
    grc /usr/bin/docker $argv
  else
    /usr/bin/docker $argv
  end
end
