function findmnt
  if isatty 1
    grc /usr/bin/findmnt $argv
  else
    /usr/bin/findmnt $argv
  end
end
