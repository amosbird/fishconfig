function lsmod
  if command -s lsmod > /dev/null
    echo fish: Unknown command \'lsmod\'
  else
    if isatty 1
      grc (command -s lsmod) $argv
    else
      command lsmod $argv
    end
  end
end
