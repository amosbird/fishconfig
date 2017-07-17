function sar
  if command -s sar > /dev/null
    echo fish: Unknown command \'sar\'
  else
    if isatty 1
      grc (command -s sar) $argv
    else
      command sar $argv
    end
  end
end
