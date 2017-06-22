function lspci
  if isatty 1
    grc /usr/sbin/lspci $argv
  else
    /usr/sbin/lspci $argv
  end
end
