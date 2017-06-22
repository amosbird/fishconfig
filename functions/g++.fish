function g++
  if isatty 1
    grc /usr/local/bin/g++ $argv
  else
    /usr/local/bin/g++ $argv
  end
end
