function semanage
  if command -s semanage > /dev/null
    echo fish: Unknown command \'semanage\'
  else
    if isatty 1
      grc (command -s semanage) $argv
    else
      command semanage $argv
    end
  end
end
