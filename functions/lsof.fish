function lsof
  if type -q lsof
    echo fish: Unknown command \'lsof\'
  else
    if isatty 1
      grc (command -s lsof) $argv
    else
      command lsof $argv
    end
  end
end
