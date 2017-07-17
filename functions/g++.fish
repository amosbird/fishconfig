function g++
  if command -s g++ > /dev/null
    echo fish: Unknown command \'g++\'
  else
    if isatty 1
      grc (command -s g++) $argv
    else
      command g++ $argv
    end
  end
end
