function id
  if isatty 1
    grc /usr/bin/id $argv
  else
    /usr/bin/id $argv
  end
end
