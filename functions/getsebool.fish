function getsebool
  if isatty 1
    grc /usr/sbin/getsebool $argv
  else
    /usr/sbin/getsebool $argv
  end
end
