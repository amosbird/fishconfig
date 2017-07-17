function lspci
  if type -q lspci
    echo fish: Unknown command \'lspci\'
  else
    if isatty 1
      grc (command -s lspci) $argv
    else
      command lspci $argv
    end
  end
end
