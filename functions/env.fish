function env
  if command -s env > /dev/null
    echo fish: Unknown command \'env\'
  else
    if isatty 1
      grc (command -s env) $argv
    else
      command env $argv
    end
  end
end
