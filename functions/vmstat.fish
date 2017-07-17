function vmstat
  if type -q vmstat
    echo fish: Unknown command \'vmstat\'
  else
    if isatty 1
      grc (command -s vmstat) $argv
    else
      command vmstat $argv
    end
  end
end
