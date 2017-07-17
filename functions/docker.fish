function docker
  if type -q docker
    echo fish: Unknown command \'docker\'
  else
    if isatty 1
      grc (command -s docker) $argv
    else
      command docker $argv
    end
  end
end
