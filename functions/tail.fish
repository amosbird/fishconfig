function tail
  if command -s tail > /dev/null
    echo fish: Unknown command \'tail\'
  else
    if isatty 1
      grc (command -s tail) $argv
    else
      command tail $argv
    end
  end
end
