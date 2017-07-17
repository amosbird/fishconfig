function lsblk
  if command -s lsblk > /dev/null
    echo fish: Unknown command \'lsblk\'
  else
    if isatty 1
      grc (command -s lsblk) $argv
    else
      command lsblk $argv
    end
  end
end
