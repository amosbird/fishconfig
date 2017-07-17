function df
  if command -s df > /dev/null
    echo fish: Unknown command \'df\'
  else
    if isatty 1
      grc (command -s df) $argv
    else
      command df $argv
    end
  end
end
