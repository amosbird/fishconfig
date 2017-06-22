function lsblk
  if isatty 1
    grc /usr/bin/lsblk $argv
  else
    /usr/bin/lsblk $argv
  end
end
