function who
  if type -q who
    echo fish: Unknown command \'who\'
  else
    if isatty 1
      grc (command -s who) $argv
    else
      command who $argv
    end
  end
end
