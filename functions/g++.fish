function g++
  if type -q g++
    echo fish: Unknown command \'g++\'
  else
    if isatty 1
      grc (command -s g++) $argv
    else
      command g++ $argv
    end
  end
end
