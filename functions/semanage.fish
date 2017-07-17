function semanage
  if type -q semanage
    echo fish: Unknown command \'semanage\'
  else
    if isatty 1
      grc (command -s semanage) $argv
    else
      command semanage $argv
    end
  end
end
