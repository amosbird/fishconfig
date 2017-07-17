function sar
  if type -q sar
    echo fish: Unknown command \'sar\'
  else
    if isatty 1
      grc (command -s sar) $argv
    else
      command sar $argv
    end
  end
end
