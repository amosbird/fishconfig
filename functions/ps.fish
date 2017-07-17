function ps
  if type -q ps
    echo fish: Unknown command \'ps\'
  else
    if isatty 1
      grc (command -s ps) $argv
    else
      command ps $argv
    end
  end
end
