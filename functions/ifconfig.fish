function ifconfig
  if command -s ifconfig > /dev/null
    echo fish: Unknown command \'ifconfig\'
  else
    if isatty 1
      grc (command -s ifconfig) $argv
    else
      command ifconfig $argv
    end
  end
end
