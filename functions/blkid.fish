function blkid
  if isatty 1
    grc /usr/sbin/blkid $argv
  else
    /usr/sbin/blkid $argv
  end
end
