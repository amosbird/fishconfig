function uptime
  if type -q uptime
    echo fish: Unknown command \'uptime\'
  else
    if isatty 1
      grc (command -s uptime) $argv
    else
      command uptime $argv
    end
  end
end
