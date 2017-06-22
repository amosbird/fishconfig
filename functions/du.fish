function du
  if isatty 1
    grc /usr/bin/du $argv
  else
    /usr/bin/du $argv
  end
end
