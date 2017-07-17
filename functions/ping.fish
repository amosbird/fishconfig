function ping
  if type -q ping
    echo fish: Unknown command \'ping\'
  else
    if isatty 1
      grc (command -s ping) $argv
    else
      command ping $argv
    end
  end
end
