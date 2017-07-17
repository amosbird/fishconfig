function lsblk
  if type -q lsblk
    echo fish: Unknown command \'lsblk\'
  else
    if isatty 1
      grc (command -s lsblk) $argv
    else
      command lsblk $argv
    end
  end
end
