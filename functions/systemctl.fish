function systemctl
  if type -q systemctl
    echo fish: Unknown command \'systemctl\'
  else
    if isatty 1
      grc (command -s systemctl) $argv
    else
      command systemctl $argv
    end
  end
end
