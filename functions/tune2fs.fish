function tune2fs
  if isatty 1
    grc /usr/sbin/tune2fs $argv
  else
    /usr/sbin/tune2fs $argv
  end
end
