function cvs
  if command -s cvs > /dev/null
    echo fish: Unknown command \'cvs\'
  else
    if isatty 1
      grc (command -s cvs) $argv
    else
      command cvs $argv
    end
  end
end
