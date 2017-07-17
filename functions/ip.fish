function ip
  if type -q ip
    echo fish: Unknown command \'ip\'
  else
    if isatty 1
      grc (command -s ip) $argv
    else
      command ip $argv
    end
  end
end
