function last
  if isatty 1
    grc /usr/bin/last $argv
  else
    /usr/bin/last $argv
  end
end
