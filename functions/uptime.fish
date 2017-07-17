function uptime
  if command -s uptime > /dev/null
    echo fish: Unknown command \'uptime\'
  else
    if isatty 1
      grc (command -s uptime) $argv
    else
      command uptime $argv
    end
  end
end
