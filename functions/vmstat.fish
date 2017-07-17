function vmstat
  if command -s vmstat > /dev/null
    echo fish: Unknown command \'vmstat\'
  else
    if isatty 1
      grc (command -s vmstat) $argv
    else
      command vmstat $argv
    end
  end
end
