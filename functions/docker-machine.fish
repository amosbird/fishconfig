function docker-machine
  if command -s docker-machine > /dev/null
    if isatty 1
      grc (command -s docker-machine) $argv
    else
      command docker-machine $argv
    end
  else
    echo fish: Unknown command \'docker-machine\'
  end
end
