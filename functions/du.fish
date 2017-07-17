function du
  if command -s du > /dev/null
    echo fish: Unknown command \'du\'
  else
    if isatty 1
      grc (command -s du) $argv
    else
      command du $argv
    end
  end
end
