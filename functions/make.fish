function make
  if isatty 1
    grc /usr/bin/make $argv
  else
    /usr/bin/make $argv
  end
end
