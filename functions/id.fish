function id
  if type -q id
    echo fish: Unknown command \'id\'
  else
    if isatty 1
      grc (command -s id) $argv
    else
      command id $argv
    end
  end
end
