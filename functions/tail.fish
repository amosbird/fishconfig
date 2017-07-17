function tail
  if type -q tail
    echo fish: Unknown command \'tail\'
  else
    if isatty 1
      grc (command -s tail) $argv
    else
      command tail $argv
    end
  end
end
