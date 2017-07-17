function ps
  if command -s ps > /dev/null
    echo fish: Unknown command \'ps\'
  else
    if isatty 1
      grc (command -s ps) $argv
    else
      command ps $argv
    end
  end
end
