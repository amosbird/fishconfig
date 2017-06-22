function tail
  if isatty 1
    grc /usr/bin/tail $argv
  else
    /usr/bin/tail $argv
  end
end
