function diff
  if command -s diff > /dev/null
    echo fish: Unknown command \'diff\'
  else
    if isatty 1
      grc (command -s diff) $argv
    else
      command diff $argv
    end
  end
end
