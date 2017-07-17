function docker-machine
  if type -q docker-machine
    echo fish: Unknown command \'docker-machine\'
  else
    if isatty 1
      grc (command -s docker-machine) $argv
    else
      command docker-machine $argv
    end
  end
end
