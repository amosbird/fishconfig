function w
  if isatty 1
    grc /usr/bin/w $argv
  else
    /usr/bin/w $argv
  end
end
