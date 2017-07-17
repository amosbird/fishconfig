function cvs
  if type -q cvs
    echo fish: Unknown command \'cvs\'
  else
    if isatty 1
      grc (command -s cvs) $argv
    else
      command cvs $argv
    end
  end
end
