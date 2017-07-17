function env
  if type -q env
    echo fish: Unknown command \'env\'
  else
    if isatty 1
      grc (command -s env) $argv
    else
      command env $argv
    end
  end
end
