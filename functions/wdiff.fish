function wdiff
  if command -s wdiff > /dev/null
    echo fish: Unknown command \'wdiff\'
  else
    if isatty 1
      grc (command -s wdiff) $argv
    else
      command wdiff $argv
    end
  end
end
