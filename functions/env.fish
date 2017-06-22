function env
  if isatty 1
    grc /usr/bin/env $argv
  else
    /usr/bin/env $argv
  end
end
