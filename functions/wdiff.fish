function wdiff
  if type -q wdiff
    echo fish: Unknown command \'wdiff\'
  else
    if isatty 1
      grc (command -s wdiff) $argv
    else
      command wdiff $argv
    end
  end
end
