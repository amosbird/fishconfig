function gcc
  if isatty 1
    grc /usr/local/bin/gcc $argv
  else
    /usr/local/bin/gcc $argv
  end
end
