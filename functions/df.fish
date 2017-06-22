function df
  if isatty 1
    grc /usr/bin/df $argv
  else
    /usr/bin/df $argv
  end
end
