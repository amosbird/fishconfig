function stat
  if isatty 1
    grc /usr/bin/stat $argv
  else
    /usr/bin/stat $argv
  end
end
