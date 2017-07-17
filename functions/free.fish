function free
  if type -q free
    echo fish: Unknown command \'free\'
  else
    if isatty 1
      grc (command -s free) $argv
    else
      command free $argv
    end
  end
end
