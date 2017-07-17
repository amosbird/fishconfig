function gcc
  if command -s gcc > /dev/null
    echo fish: Unknown command \'gcc\'
  else
    if isatty 1
      grc (command -s gcc) $argv
    else
      command gcc $argv
    end
  end
end
