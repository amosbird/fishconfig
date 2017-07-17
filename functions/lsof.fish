function lsof
  if command -s lsof > /dev/null
    echo fish: Unknown command \'lsof\'
  else
    if isatty 1
      grc (command -s lsof) $argv
    else
      command lsof $argv
    end
  end
end
