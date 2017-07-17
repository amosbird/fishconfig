function docker
  if command -s docker > /dev/null
    echo fish: Unknown command \'docker\'
  else
    if isatty 1
      grc (command -s docker) $argv
    else
      command docker $argv
    end
  end
end
