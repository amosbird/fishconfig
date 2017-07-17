function ss
  if command -s ss > /dev/null
    echo fish: Unknown command \'ss\'
  else
    if isatty 1
      grc (command -s ss) $argv
    else
      command ss $argv
    end
  end
end
