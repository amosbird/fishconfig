function getfacl
  if isatty 1
    grc /usr/bin/getfacl $argv
  else
    /usr/bin/getfacl $argv
  end
end
