function vmstat
  if isatty 1
    grc /usr/bin/vmstat $argv
  else
    /usr/bin/vmstat $argv
  end
end
