function netstat
  if command -s netstat > /dev/null
    echo fish: Unknown command \'netstat\'
  else
    if isatty 1
      grc (command -s netstat) $argv
    else
      command netstat $argv
    end
  end
end
