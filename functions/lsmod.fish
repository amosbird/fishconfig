function lsmod
  if type -q lsmod
    echo fish: Unknown command \'lsmod\'
  else
    if isatty 1
      grc (command -s lsmod) $argv
    else
      command lsmod $argv
    end
  end
end
